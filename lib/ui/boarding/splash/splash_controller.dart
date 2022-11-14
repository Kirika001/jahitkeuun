import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController{
  // final storage = StorageCore();

  @override
  void onInit() {
    // storage.ensureStorageReady();
    Timer(const Duration(seconds: 3), () {
      // if(storage.getAccessToken() == null || storage.getAccessToken() == "token_not_loaded"){
        Get.offAllNamed("/onboarding");
      // } else {
      //   Get.offAllNamed("/article");
      // }

    });
    super.onInit();

  }
}