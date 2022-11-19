import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/data/model/category_model.dart';
import 'package:jahitkeeun/data/model/current_address_model.dart';
import 'package:jahitkeeun/data/model/tailor_model.dart';

class HomeController extends BaseController {
  CategoryModel? categoryModel;
  TailorModel? tailorModel;
  CurrentAddressModel? currentAddress;
  bool isLoading = false;

  List<Widget> image = [
    Image.asset('assets/slider1.png', fit: BoxFit.cover),
    Image.asset('assets/slider2.png', fit: BoxFit.cover),
    Image.asset('assets/slider3.png', fit: BoxFit.cover),
    Image.asset('assets/slider4.png', fit: BoxFit.cover),
  ];
  var currentIndex = 0.obs;
  CarouselController carouselController = CarouselController();

  @override
  void onInit() {
    super.onInit();
    image;
    categoryList();
    update();
  }

  void categoryList() async {
    isLoading = true;
    try {
      var category =
          await repository.getCategory(storage.getAccessToken() ?? '');
      var tailor = await repository.getTailor(storage.getAccessToken() ?? '');
      var address = await repository.getCurrentAddress(
          storage.getAccessToken() ?? '', storage.getCurrentUserId() ?? 0);
      isLoading = false;
      tailorModel = tailor;
      categoryModel = category;
      currentAddress = address;
      update();
    } catch (e) {
      return e.printError();
    }
  }
}
