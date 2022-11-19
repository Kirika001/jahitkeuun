import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/data/model/category_model.dart';
import 'package:jahitkeeun/data/model/current_address_model.dart';
import 'package:jahitkeeun/data/model/login_model.dart';
import 'package:jahitkeeun/data/model/logout_model.dart';
import 'package:jahitkeeun/data/model/register_model.dart';
import 'package:jahitkeeun/data/model/tailor_byitemid_model.dart';
import 'package:jahitkeeun/data/model/tailor_detail_model.dart';
import 'package:jahitkeeun/data/model/tailor_model.dart';
import 'package:jahitkeeun/data/network_core.dart';
import 'package:jahitkeeun/data/repository/repository.dart';

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();

  @override
  FutureOr<RegisterModel?> postRegister(String name, String email, String password) async {
    try{
      var response = await network.dio.post('/auth/register', data: {
        "name" : name,
        "email" : email,
        "password" : password
      });
      print(response.data);
      return RegisterModel.fromJson(response.data);

    } on DioError catch (e){
      print(e.response?.data);
      return RegisterModel.fromJson(e.response?.data);

    }
  }

  @override
  FutureOr<LoginModel?> postLogin(String email, String password) async {
    try{
      var response = await network.dio.post('/auth/login', data: {
        "email" : email,
        "password" : password
      });
      print(response.data);
      return LoginModel.fromJson(response.data);
      
    }on DioError catch(e){
      print(e.response?.data);
      return LoginModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<LogoutModel> postLogout(String token) async {
    try {
      var response = await network.dio.post("/auth/logout",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          })
      );
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
            "Accept": "applicatin/json",
            "Authorization": "Bearer $token"
          }));
      return CategoryModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }

  @override
  FutureOr<TailorModel?> getTailor(String token) async {
    try {
      var response = await network.dio.get("/taylor",
          options: Options(headers: {
            "Accept": "applicatin/json",
            "Authorization": "Bearer $token"
          }));
      return TailorModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }

  @override
  FutureOr<CurrentAddressModel?> getCurrentAddress(String token, int userID) async {
    try {
      var response = await network.dio.get("/sectionitemalamat/$userID",
          options: Options(headers: {
            "Accept": "applicatin/json",
            "Authorization": "Bearer $token"
          }));
      return CurrentAddressModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }

  @override
  FutureOr<TailorByitemidModel?> getTailorByitemid(String token, int itemID) async {
    try {
      var response = await network.dio.get("/sectionitem/$itemID",
          options: Options(headers: {
            "Accept": "applicatin/json",
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
      var response = await network.dio.get("/datamaster/taylor/$id",
          options: Options(headers: {
            "Accept": "applicatin/json",
            "Authorization": "Bearer $token"
          }));
      return TailorDetailModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }
}