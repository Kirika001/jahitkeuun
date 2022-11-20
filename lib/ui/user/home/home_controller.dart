import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
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
    Future.wait([
      categoryList(),
      fetchAddress(),
      fetchTaylor()
    ]);
    // categoryList();
    update();
  }

  Future<void> categoryList() async {
    try {
      var category =
          await repository.getCategory(storage.getAccessToken() ?? '');
      categoryModel = category;
      update();
    } on DioError catch(e) {
      print(e.response?.data.toString());
      return e.printError();
    }
  }

  Future<void> fetchTaylor() async {
    try {
      var tailor = await repository.getTailor(storage.getAccessToken() ?? '');
      tailorModel = tailor;
      update();
    } on DioError catch(e) {
      debugPrint(e.response?.data.toString());
    }
  }

  Future<void> fetchAddress() async {
    try {
      var address = await repository.getCurrentAddress(
          storage.getAccessToken() ?? '', storage.getCurrentUserId() ?? 0);
      currentAddress = address;
      update();
    } on DioError catch(e) {
      debugPrint(e.response?.data.toString());
    }

  }


}
