import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';

// class VideoPlayerPage extends GetView<VideoPlayerViewController> {
//   const VideoPlayerPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PodVideoPlayer(controller: controller.playVideo(Get.arguments)),
//     );
//   }
// }
class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(Get.arguments[0]),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String model = Get.arguments[1];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.deepBlue,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
            )),
      ),
      body: Column(
        children: [
          PodVideoPlayer(controller: controller),
        ],
      ),
    );
  }
}
