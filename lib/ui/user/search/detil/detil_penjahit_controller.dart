import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/data/model/category_bytailorid_model.dart';
import 'package:jahitkeeun/data/model/tailor_detail_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetilPenjahitController extends BaseController {
  TailorDetailModel? tailorDetailModel;
  CategoryBytailoridModel? categoryTailorModel;
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

      var category = await repository.getCategoryTailor(storage.getAccessToken() ?? '', Get.arguments);
      categoryTailorModel = category;
      print('category taylor : ${categoryTailorModel!.data!.data!.first.itemName}');

      isLoading = false;
      update();
    } catch (e) {
      return e.printError();
    }
  }

  void chat(String nomor) async {
    var contact = "+62$nomor";
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    var iosUrl =
        "https://wa.me/$contact?text=${Uri.parse('Halo! Saya Mau Konsultasi untuk membuat pakaian')}";

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
