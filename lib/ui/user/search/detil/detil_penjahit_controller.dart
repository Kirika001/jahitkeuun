import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/data/model/tailor_detail_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetilPenjahitController extends BaseController {
  TailorDetailModel? tailorDetailModel;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    tailorDetail();
  }

  void tailorDetail() async {
    isLoading = true;
    try {
      var response = await repository.getTailorDetail(
          storage.getAccessToken() ?? '', Get.arguments);
      tailorDetailModel = response;
      isLoading = false;
      update();
    } catch (e) {
      return e.printError();
    }
  }

  void chat() async {
    var contact = "+6281394683395";
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    var iosUrl =
        "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: 'WhatsApp is not installed.');
    }
  }
}
