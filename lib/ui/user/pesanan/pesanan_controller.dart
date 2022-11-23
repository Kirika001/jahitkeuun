import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/data/model/client_order_model.dart';

class PesananController extends BaseController {
  ClientOrderModel? clientOrderModel;

  String? cekStatus;

  String? buttonTitle;
  VoidCallback? buttonAction;
  Color? buttonColor;

  @override
  void onInit() {
    super.onInit();
    Future.wait([clientOrderList()]);
    status();
  }

  Future<void> clientOrderList() async {
    try {
      var orderList = await repository.getClientOrder(
          storage.getAccessToken() ?? '', storage.getCurrentUserId() ?? 0);
      clientOrderModel = orderList;
      update();
    } catch (e) {
      return e.printError();
    }
  }

  void status() {
    switch (cekStatus) {
      case "BELUM BAYAR":
        {
          buttonColor = warningColor;
          buttonTitle = "Bayar Sekarang";
          buttonAction = () {
            print('bayar sekarang');
          };
        }
        break;
      case "LUNAS":
        {
          buttonColor = Colors.transparent;
          buttonTitle = "";
          buttonAction = () {
            print('udah lunas');
          };
        }
    }
  }
}
