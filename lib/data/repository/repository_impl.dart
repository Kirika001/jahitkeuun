import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/data/model/login_model.dart';
import 'package:jahitkeeun/data/model/logout_model.dart';
import 'package:jahitkeeun/data/model/register_model.dart';
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
}