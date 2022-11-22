import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:jahitkeeun/data/model/add_to_cart_model.dart';
import 'package:jahitkeeun/data/model/category_bytailorid_model.dart';
import 'package:jahitkeeun/data/model/category_model.dart';
import 'package:jahitkeeun/data/model/checkout_model.dart';
import 'package:jahitkeeun/data/model/client_order_model.dart';
import 'package:jahitkeeun/data/model/current_address_model.dart';
import 'package:jahitkeeun/data/model/delete_cart_model.dart';
import 'package:jahitkeeun/data/model/login_model.dart';
import 'package:jahitkeeun/data/model/logout_model.dart';
import 'package:jahitkeeun/data/model/register_model.dart';
import 'package:jahitkeeun/data/model/search_tailor_model.dart';
import 'package:jahitkeeun/data/model/tailor_byitemid_model.dart';
import 'package:jahitkeeun/data/model/tailor_detail_model.dart';
import 'package:jahitkeeun/data/model/tailor_model.dart';
import 'package:jahitkeeun/data/model/tailor_service_model.dart';
import 'package:jahitkeeun/data/model/update_qty_cart_model.dart';
import 'package:jahitkeeun/data/model/user_cart_model.dart';
import 'package:jahitkeeun/data/network_core.dart';
import 'package:jahitkeeun/data/repository/repository.dart';

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();

  @override
  FutureOr<RegisterModel?> postRegister(
      String name, String email, String password) async {
    try {
      var response = await network.dio.post('/auth/register',
          data: {"name": name, "email": email, "password": password});
      print(response.data);
      return RegisterModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.response?.data);
      return RegisterModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<LoginModel?> postLogin(String email, String password) async {
    try {
      var response = await network.dio
          .post('/auth/login', data: {"email": email, "password": password});
      print(response.data);
      return LoginModel.fromJson(response.data);
    } on DioError catch (e) {
      print("error login : ${e.response?.data}");
      // print("error login : ${LoginModel.fromJson(e?.response?.data)}");
      return e.response?.data!;
    }
  }

  @override
  FutureOr<LogoutModel> postLogout(String token) async {
    try {
      var response = await network.dio.post("/auth/logout",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      print(response.data);
      return LogoutModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.response?.data.toString());
      return LogoutModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<CategoryModel?> getCategory(String token) async {
    try {
      var response = await network.dio.get("/sectionitem",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      return CategoryModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        Get.offAllNamed('/login');
      }
      print(e.error);
      return e.error;
    }
  }

  @override
  FutureOr<TailorModel?> getTailor(String token, int page) async {
    try {
      var response = await network.dio.get("/taylor",
          queryParameters: {"page": page},
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      return TailorModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }

  @override
  FutureOr<CurrentAddressModel?> getCurrentAddress(
      String token, int userID) async {
    try {
      var response = await network.dio.get("/sectionitemalamat/$userID",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      return CurrentAddressModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        Get.offAllNamed('/login');
      }
      print(e.error);
      return e.error;
    }
  }

  @override
  FutureOr<TailorByitemidModel?> getTailorByitemid(
      String token, int itemID) async {
    try {
      var response = await network.dio.get("/sectionitem/$itemID",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      return TailorByitemidModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }

  @override
  FutureOr<TailorDetailModel?> getTailorDetail(String token, int id) async {
    try {
      var response = await network.dio.get("/taylor/$id",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      return TailorDetailModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }

  @override
  FutureOr<CategoryBytailoridModel> getCategoryTailor(
      String token, int id) async {
    try {
      var response = await network.dio.get("/sectionitem/taylorId/$id",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      return CategoryBytailoridModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }

  @override
  FutureOr<TailorServiceModel?> getServiceTailor(
      String token, int tailorID, itemID) async {
    try {
      var response = await network.dio.get(
          "/sectionitem/taylorId/$tailorID/itemId/$itemID",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      return TailorServiceModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }

  @override
  FutureOr<AddToCartModel?> postAddCart(String token, int userID, int serviceID,
      int qty, String pickup, String desc, File photo) async {
    try {
      var formData = FormData.fromMap({
        "user_id": userID,
        "service_id": serviceID,
        "quantity": qty,
        "pickup": pickup,
        "desc": desc
      });

      if (photo != null) {
        formData.files.addAll([
          MapEntry("photoClient1", await MultipartFile.fromFile(photo.path))
        ]);
      }

      var response = await network.dio.post("/sectionitem",
          data: formData,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data"
          }));
      print(response.data);
      return AddToCartModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.response?.data);
      return AddToCartModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<UserCartModel?> getUserCart(String token, int userID) async {
    try {
      var response = await network.dio.get("/sectionitem/userId/$userID",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      return UserCartModel.fromJson(response.data);
    } on DioError catch (e) {
      print('errornya : ${e.response?.data![1]}');
      return e.response?.data!;
    }
  }

  @override
  FutureOr<DeleteCartModel?> deleteUserCart(
      String token, int userID, int serviceID) async {
    try {
      var response = await network.dio.delete(
          "/sectionitem/userId/$userID/service/$serviceID",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      return DeleteCartModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }

  @override
  FutureOr<UpdateQtyCartModel?> updateQtyCart(
      String token, int userID, int serviceID, String qty) async {
    try {
      var response = await network.dio.post(
          "/sectionitem/userId/$userID/service/$serviceID",
          data: {"quantity": qty},
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      return UpdateQtyCartModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }

  @override
  FutureOr<SearchTailorModel?> searchTailor(
      String token, String searchName) async {
    try {
      var response = await network.dio.get("/search/$searchName",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      return SearchTailorModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }

  @override
  FutureOr<CheckoutModel?> postCheckout(
      String token, int userID, int amount, String userAddress) async {
    try {
      var response = await network.dio.post("/sectionitem/checkout",
          data: {
            "user_id": userID,
            "amount": amount,
            "address": userAddress,
            "deliveries_id": 1,
            "payment_method_id": 1,
            "shipping_method_id": 1
          },
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      return CheckoutModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }

  @override
  FutureOr<ClientOrderModel?> getClientOrder(String token, int userID) async {
    try {
      var response = await network.dio.get("/dashboardclientorder/$userID",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      return ClientOrderModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }
}
