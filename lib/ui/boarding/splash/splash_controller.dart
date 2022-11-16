import 'dart:async';

import 'package:get/get.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/data/storage_core.dart';

class SplashController extends BaseController{
  final storage = StorageCore();

  @override
  void onInit() {
    storage.ensureStorageReady();
    Timer(const Duration(seconds: 3), () {
      if(storage.getAccessToken() == null || storage.getAccessToken() == "token_not_loaded"){
        Get.offAllNamed("/onboarding");
      } else if(storage.getCurrentUserRole() == 'client'){
        Get.offAllNamed("/userDashboard");
      } else if(storage.getCurrentUserRole() == 'tailor'){
        Get.offAllNamed("/tailorDashboard");
      }

    });
    super.onInit();

  }
}