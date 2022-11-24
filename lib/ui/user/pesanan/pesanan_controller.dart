import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/data/model/client_order_model.dart';
import 'package:jahitkeeun/data/model/update_statusorder_model.dart';

class PesananController extends BaseController {
  ClientOrderModel? clientOrderModel;
  UpdateStatusorderModel? updateStatusorderModel;

  String? cekStatus;

  String? buttonTitle;
  VoidCallback? buttonAction;
  Color? buttonColor;

  @override
  void onInit() {
    super.onInit();
    Future.wait([
      clientOrderList()
    ]);
    statusPesanan();
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

  Future<void> updateOrder(int orderID, String orderStatus) async {
    try {
      var updateStatus = await repository.updateStatusOrder(
          storage.getAccessToken() ?? '', orderID, orderStatus);

      updateStatusorderModel = updateStatus;
      Fluttertoast.showToast(msg: updateStatus?.meta?.message ?? 'gagal update');
      if (updateStatus?.meta?.status == 'success') {
        clientOrderList();
        update();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void statusPesanan(){
    switch (cekStatus) {
      case "Menunggu Pembayaran":
        {
          buttonColor = infoColor;
          buttonTitle = "Bayar Sekarang";
        }
        break;
      case "LUNAS":
        {
          buttonColor = Colors.transparent;
          buttonTitle = "";
        }
        break;
    }

  }


}
