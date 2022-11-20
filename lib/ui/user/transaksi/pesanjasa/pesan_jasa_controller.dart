import 'dart:io';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/data/model/category_bytailorid_model.dart' as category;
import 'package:jahitkeeun/data/model/tailor_service_model.dart' as service;

enum DetailViewState {
  loading,
  none,
}

class PesanJasaController extends BaseController {
  final descController = TextEditingController();

  NumberFormat numberFormat = NumberFormat.currency(
    locale: "id",
    symbol: "Rp. ",
    decimalDigits: 0
  );

  String? selectedItem;
  String? selectedJasa;

  DetailViewState _state = DetailViewState.none;

  DetailViewState get state => _state;

  category.CategoryBytailoridModel? categoryTailorModel;
  service.TailorServiceModel? serviceTailorModel;


  List<category.Data1> listCategoryItem = [];
  List<service.Data1> listServiceItem = [];

  CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'id', symbol: 'Rp ');

  File? gettedPhoto;
  bool isLoading = false;
  List serviceItems = [];
  DateTime? selectedDate;

  int qty = 1;
  num harga = 0;
  String name = Get.arguments["tailorName"];
  // List selectedJasa = [];
  int? serviceID;

  @override
  void onInit() {
    super.onInit();
    formatter;
    listItem();
    descController.text;
  }

  chanrState(DetailViewState s) {
    _state = s;
    update();
  }

  void listItem() async {
    listCategoryItem = [];
    chanrState(DetailViewState.loading);
    update();
    try {
      var categories = await repository.getCategoryTailor(
          storage.getAccessToken() ?? '', Get.arguments['tailorID']);
      categoryTailorModel = categories;
      listCategoryItem.addAll(categories.data?.data?.toSet().toList() ?? []);
      // selectedItem.value = categoryTailorModel?.data?.data?.first.itemId ?? "";
      // print(
      //     'category taylor : ${categoryTailorModel!.data!.data!.first.itemName}');
      chanrState(DetailViewState.none);
      update();
    } catch (e) {
      return e.printError();
    }
  }

  void listService(int itemID) async {
    // isLoading = true;
    // serviceItems.clear();
    listServiceItem = [];
    update();
    try {
      var services = await repository.getServiceTailor(
          storage.getAccessToken() ?? '', Get.arguments['tailorID'], itemID);
      serviceTailorModel = services;
      listServiceItem.addAll(services?.data?.data?.toSet().toList() ?? []);
      // print(
      //     'service tailor : ${serviceTailorModel!.data!.data!.first.serviceName}');
      // for (var s in (serviceTailorModel!.data!.data!)) {
      //   serviceItems.add(s);
      // }
      // selectedJasa.value = serviceItems.first.taylorId ?? "";
      // isLoading = false;
      update();
    } catch (e) {
      return e.printError();
    }
  }

  getSinglePhoto() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File file = File(image.path);
      gettedPhoto = file;
      update();
    } else {
      // User canceled the picker
    }
  }

  void decQty() {
    if (qty != 1) {
      qty = qty - 1;
      update();
    }
  }

  void incQty() {
    qty = qty + 1;
    update();
  }

  addToCart() async {
    var response = await repository.postAddCart(
        storage.getAccessToken()!,
        storage.getCurrentUserId()!,
        serviceID!,
        qty,
        selectedDate.toString(),
        descController.text,
        gettedPhoto!);

    Fluttertoast.showToast(msg: response?.meta?.message ?? 'gagal menambahkan keranjang');
    if (response?.meta?.status == 'success') {
      Get.offAllNamed('/keranjang');
    }
  }
}
