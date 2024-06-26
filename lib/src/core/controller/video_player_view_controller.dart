import 'dart:developer';

import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pod_player/pod_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CommonVideoPlayer extends StatefulWidget {
  const CommonVideoPlayer({
    super.key,
    required this.videoLink,
    this.autoPlayVideo = false,
    this.isLive = false,
  });
  final String videoLink;
  final bool autoPlayVideo;
  final bool isLive;

  @override
  State<CommonVideoPlayer> createState() => _CommonVideoPlayerState();
}

class _CommonVideoPlayerState extends State<CommonVideoPlayer> {
  PodPlayerController? podPlayerController;
  PodPlayerController? _liveCheckingPodController;
  final Rx<bool> _isVideoLoading = false.obs;
  String _youTubeVideoLink = '';
  bool _isLiveVideo = false;

  @override
  void initState() {
    super.initState();
    if (podPlayerController?.isInitialised == true) {
      podPlayerController?.pause();
      log('was initialized on init state, now paused');
    }
    _getVideo(widget.videoLink);
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey(widget.videoLink),
      onVisibilityChanged: (visibilityInfo) {
        final visiblePercentage = visibilityInfo.visibleFraction * 100;
        log('visiblePercentage $visiblePercentage');
        if (visiblePercentage < 50) {
          podPlayerController?.pause();
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(00),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            color: Colors.black,
            padding: const EdgeInsets.only(bottom: 1),
            child: Obx(() {
              if (_isVideoLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1.5,
                  ),
                );
              } else {
                return PodVideoPlayer(
                  matchVideoAspectRatioToFrame: true,
                  controller: podPlayerController!,
                );
              }
            }),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    if (podPlayerController?.isVideoPlaying ?? false) {
      log('dispose called');
      podPlayerController?.dispose();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log('didChangeDependencies called');
    if (podPlayerController?.isInitialised == true) {
      podPlayerController?.pause();
      log('was initialized when didChangeDependencies called, now paused');
      setState(() {
        _getVideo(widget.videoLink);
      });
    }
  }

  @override
  void didUpdateWidget(covariant CommonVideoPlayer oldWidget) {
    log('didUpdateWidget called');
    log('oldWidget.videoLink ${oldWidget.videoLink}');
    log('widget.videoLink ${widget.videoLink}');
    if (oldWidget.videoLink != widget.videoLink) {
      log('oldWidget.videoLink != widget.videoLink');
      podPlayerController?.pause();
      _getVideo(widget.videoLink);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _getVideo(String videoLink) async {
    _youTubeVideoLink = videoLink;
    await _getYouTubeVideo();
  }

  Future<void> _getYouTubeVideo() async {
    _isVideoLoading.value = true;
    try {
      await _checkIfTheVideoIsLive();
      _isVideoLoading.value = false;
    } catch (e) {
      Log.debug('error in video player $e');
      _isVideoLoading.value = false;
    }
  }

  Future<void> _checkIfTheVideoIsLive() async {
    _isLiveVideo = widget.isLive;

    await _initializeVideoPlayerController();
  }

  Future<void> _initializeVideoPlayerController() async {
    if (podPlayerController != null && podPlayerController!.isInitialised) {
      await podPlayerController?.changeVideo(
        playVideoFrom: PlayVideoFrom.youtube(
          _youTubeVideoLink,
          live: _isLiveVideo,
        ),
        playerConfig: _getPodPlayerConfig(),
      );
    } else {
      podPlayerController = PodPlayerController(
        playVideoFrom: PlayVideoFrom.youtube(
          _youTubeVideoLink,
          live: _isLiveVideo,
        ),
        podPlayerConfig: _getPodPlayerConfig(),
      )..initialise();
    }

    if (_liveCheckingPodController != null &&
        _liveCheckingPodController!.isInitialised) {
      _liveCheckingPodController?.dispose();
    }
  }

  PodPlayerConfig _getPodPlayerConfig() {
    return PodPlayerConfig(
      autoPlay: widget.autoPlayVideo,
      isLooping: false,
      videoQualityPriority: [144, 240, 360, 480],
      wakelockEnabled: true,
    );
  }
}
