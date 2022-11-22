import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/data/model/client_order_model.dart';

class PesananController extends BaseController {
  ClientOrderModel? clientOrderModel;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> clientOrderList() async {
    try {
      var orderList =
      await repository.getClientOrder(storage.getAccessToken() ?? '', storage.getCurrentUserId() ?? 0);
      clientOrderModel = orderList;
      update();
    } catch(e) {
      return e.printError();
    }
  }
}