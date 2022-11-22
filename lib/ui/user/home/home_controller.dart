import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/data/model/category_model.dart';
import 'package:jahitkeeun/data/model/current_address_model.dart';
import 'package:jahitkeeun/data/model/tailor_model.dart';

class HomeController extends BaseController {
  final PagingController<int, Data2> pagingController =
  PagingController(firstPageKey: 0);

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
      fetchTaylor(1)
    ]);

    pagingController.addPageRequestListener((pageKey) {
      fetchTaylor(pageKey);
    });
    // categoryList();
    update();
  }

  // Future<void> _fetchPage(int page) async {
  //   try{
  //     final newItems = await repository.getTailor(storage.getAccessToken()! ,page);
  //     final isLastPage = newItems!.data!.total! < newItems.data!.perPage!;
  //     if (isLastPage){
  //       pagingController.appendLastPage(newItems.data!.data!);
  //     } else  {
  //       final nextPageKey = page + newItems.data!.data!.length;
  //       pagingController.appendPage(newItems.data!.data!, nextPageKey);
  //     }
  //   } catch (error){
  //     pagingController.error = error;
  //   }
  // }

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

  Future<void> fetchTaylor(int page) async {
    try {
      var tailor = await repository.getTailor(storage.getAccessToken() ?? '', page);
      tailorModel = tailor;

      final isLastPage = tailorModel!.data!.total! < tailorModel!.data!.perPage!;
      if (isLastPage){
        pagingController.appendLastPage(tailorModel!.data!.data!);
      } else  {
        final nextPageKey = page + tailorModel!.data!.data!.length;
        pagingController.appendPage(tailorModel!.data!.data!, nextPageKey);
      }
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
