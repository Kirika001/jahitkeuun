import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/base/base_controller.dart';

class HomeController extends BaseController{
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
    update();
  }
}