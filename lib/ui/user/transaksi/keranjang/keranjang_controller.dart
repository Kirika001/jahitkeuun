import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/data/model/delete_cart_model.dart';
import 'package:jahitkeeun/data/model/update_qty_cart_model.dart';
import 'package:jahitkeeun/data/model/user_cart_model.dart' as cart;

class KeranjangController extends BaseController{
  NumberFormat numberFormat =
  NumberFormat.currency(locale: "id", symbol: "Rp. ", decimalDigits: 0);

  cart.UserCartModel? userCartModel;
  DeleteCartModel? deleteCartModel;
  UpdateQtyCartModel? updateQtyCartModel;
  bool isLoading = false;
  int tempQty = 0;
  int subtotal = 0;
  int grandTotal = 0;

  List<cart.Data1> listCarts = [];

  @override
  void onInit() {
    super.onInit();

    Future.wait([
      fetchCart()
    ]);
  }

  Future<void> fetchCart() async {
    isLoading = true;
    grandTotal = 0;
    subtotal = 0;
    listCarts.clear();
    update();
    try {
      var carts = await repository.getUserCart(storage.getAccessToken() ?? '', storage.getCurrentUserId() ?? 0);
      userCartModel = carts;
      print(carts!.meta?.message);
      listCarts.addAll(carts!.data?.data?.toSet().toList() ?? []);

      listCarts.forEach((e) {
        subtotal = 0;
        subtotal = int.parse(e.price!.split('.').first) * int.parse(e.quantity!);
        grandTotal = grandTotal + subtotal;
        update();
      });

      isLoading = false;
      update();
    } on DioError catch(e) {
      debugPrint(e.response?.data.toString());
    }
  }

  Future<void> deleteCart(int serviceID) async{
    isLoading = true;
    try {
      var delete = await repository.deleteUserCart(storage.getAccessToken() ?? '', storage.getCurrentUserId() ?? 0, serviceID);
      deleteCartModel = delete;

      Fluttertoast.showToast(msg: delete?.meta?.message ?? 'gagal menghapus keranjang');
      if (delete?.meta?.status == 'success') {
        fetchCart();
        update();
      }
      isLoading = false;
      update();
    } on DioError catch(e) {
      debugPrint(e.response?.data.toString());
    }
  }

  Future<void> incQty(int serviceID, int qty) async{
    tempQty = qty+1;
    // tempQty = tempQty+1;
    try {
      var increase = await repository.updateQtyCart(storage.getAccessToken() ?? '', storage.getCurrentUserId() ?? 0, serviceID, tempQty.toString());
      updateQtyCartModel = increase;

      // Fluttertoast.showToast(msg: increase?.meta?.message ?? 'gagal menambah quantity');
      if (increase?.meta?.status == 'success') {
        fetchCart();
        update();
      }
      update();
    } on DioError catch(e) {
      debugPrint(e.response?.data.toString());
    }
  }

  Future<void> decQty(int serviceID, int qty) async {
    tempQty = qty - 1;
    // tempQty = tempQty+1;
    try {
      var decrease = await repository.updateQtyCart(
          storage.getAccessToken() ?? '',
          storage.getCurrentUserId() ?? 0,
          serviceID,
          tempQty.toString());
      updateQtyCartModel = decrease;

      // Fluttertoast.showToast(msg: increase?.meta?.message ?? 'gagal menambah quantity');
      if (decrease?.meta?.status == 'success') {
        fetchCart();
        update();
      }
      update();
    } on DioError catch (e) {
      debugPrint(e.response?.data.toString());
    }
  }
}