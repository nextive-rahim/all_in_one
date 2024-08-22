import 'dart:io';

import 'package:all_in_one/src/core/page_state/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadInvoiceViewController extends GetxController {
  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);

  get pageState => _pageStateController.value;
  final RxInt dowdloadProgress = 0.obs;
  late String _localPath;
  late bool permissionReady;
  late TargetPlatform? platform;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (Platform.isAndroid) {
      platform = TargetPlatform.android;
    } else {
      platform = TargetPlatform.iOS;
    }
  }

  Future<bool> checkPermission() async {
    if (platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<void> prepareSaveDir() async {
    _localPath = (await findLocalPath())!;

    print(_localPath);
    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<String?> findLocalPath() async {
    if (platform == TargetPlatform.android) {
      return "/sdcard/download/";
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return '${directory.path}${Platform.pathSeparator}Download';
    }
  }

  Future<File> dowmloadInvoice(String url) async {
    print('dddd');
    String fileName = url.split('/').last;
    try {
      print('dddd2');
      String filePath = '$_localPath/$fileName';
      File file = File(filePath);
      print('dddd3');
      // if (await file.exists()) {
      //   return file;
      // }

      await Dio().download(
        url,
        filePath,
        onReceiveProgress: (count, total) {
          print(count);
          print(total);
          dowdloadProgress.value = (count / total * 100).toInt();

          update();
          // print(dowdloadProgress.value);
        },
      );
      return file;
    } catch (e) {
      throw Exception('Error opening url file');
    }
  }
}
