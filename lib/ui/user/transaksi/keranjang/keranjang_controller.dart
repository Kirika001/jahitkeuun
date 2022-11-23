import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/data/model/add_to_cart_model.dart';
import 'package:jahitkeeun/data/model/checkout_model.dart';
import 'package:jahitkeeun/data/model/current_address_model.dart';
import 'package:jahitkeeun/data/model/delete_cart_model.dart';
import 'package:jahitkeeun/data/model/update_qty_cart_model.dart';
import 'package:jahitkeeun/data/model/user_cart_model.dart' as cart;

class KeranjangController extends BaseController {
  NumberFormat numberFormat =
      NumberFormat.currency(locale: "id", symbol: "Rp. ", decimalDigits: 0);

  cart.UserCartModel? userCartModel;
  CurrentAddressModel? currentAddress;
  DeleteCartModel? deleteCartModel;
  UpdateQtyCartModel? updateQtyCartModel;
  CheckoutModel? checkoutModel;
  bool isLoading = false;
  bool dataKosong = false;
  int tempQty = 0;
  int qty = 1;
  int subtotal = 0;
  int grandTotal = 0;
  String alamat = '';

  List<cart.Data1> listCarts = [];

  @override
  void onInit() {
    super.onInit();

    Future.wait([
      fetchCart(),
      fetchAddress(),
    ]);
  }

  Future<void> fetchCart() async {
    isLoading = true;
    grandTotal = 0;
    subtotal = 0;
    listCarts.clear();
    update();
    try {
      var carts = await repository.getUserCart(
          storage.getAccessToken() ?? '', storage.getCurrentUserId() ?? 0);
      userCartModel = carts;
      print('status = ${carts!.meta?.message}');
      listCarts.addAll(carts!.data?.data?.toSet().toList() ?? []);

      listCarts.forEach((e) {
        subtotal = 0;
        subtotal =
            int.parse(e.price!.split('.').first) * int.parse(e.quantity!);
        grandTotal = grandTotal + subtotal;
        update();
      });

      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      dataKosong = true;
      update();
      // debugPrint('errornya = ${e.response?.data.toString()}');
      // e.runtimeType
      debugPrint ('ini error : ${e.toString()}');
    }
  }

  Future<void> fetchAddress() async {
    try {
      var address = await repository.getCurrentAddress(
          storage.getAccessToken() ?? '', storage.getCurrentUserId() ?? 0);
      currentAddress = address;

      alamat = currentAddress?.data?.first.alamat?? '';
      update();
    } on DioError catch(e) {
      debugPrint(e.response?.data.toString());
    }

  }

  Future<void> deleteCart(int serviceID) async {
    isLoading = true;
    try {
      var delete = await repository.deleteUserCart(
          storage.getAccessToken() ?? '',
          storage.getCurrentUserId() ?? 0,
          serviceID);
      deleteCartModel = delete;

      Fluttertoast.showToast(
          msg: delete?.meta?.message ?? 'gagal menghapus keranjang');
      if (delete?.meta?.status == 'success') {
        fetchCart();
        update();
      }
      isLoading = false;
      update();
    } on DioError catch (e) {
      debugPrint(e.response?.data.toString());
    }
  }

  Future<void> incQty(int serviceID, int index) async {
    tempQty = tempQty + 1;
    try {
      var increase = await repository.updateQtyCart(
          storage.getAccessToken() ?? '',
          storage.getCurrentUserId() ?? 0,
          serviceID,
          tempQty.toString());
      updateQtyCartModel = increase;

      // Fluttertoast.showToast(msg: increase?.meta?.message ?? 'gagal menambah quantity');
      if (increase?.meta?.status == 'success') {
        fetchCart();
        update();
      }
      update();
    } on DioError catch (e) {
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

  checkout() async {
    print('total : $grandTotal \nalamat:$alamat');
    try {
      var checkout = await repository.postCheckout(storage.getAccessToken()!,
          storage.getCurrentUserId()!, grandTotal, alamat);
      checkoutModel = checkout;

      if(checkoutModel?.meta?.status == "success"){
        Get.offNamed('/checkout',arguments: {
          'alamat' : alamat,
          'listItem' : listCarts,
          'amount' : grandTotal
        });

      }

    } on DioError catch (e) {
      debugPrint(e.response?.data.toString());
    }
  }
}
