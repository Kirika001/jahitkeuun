import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/data/model/login_model.dart';
import 'package:jahitkeeun/data/storage_core.dart';


class LoginController extends BaseController {
  final storage = StorageCore();

  LoginModel? loginModel;
  bool isLoading = false;

  final key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    isLoading;
    emailController.text;
    passwordController.text;
    update();
  }

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  void doLogin(String email, String password) async {
    isLoading = true;
    update();
    try {
      var response =
          await repository.postLogin(email, password);
      loginModel = response;

      if (loginModel?.meta?.status == 'success') {
        isLoading = false;
        storage.saveAuthResponse(response);
        print(storage.getAccessToken());
        Fluttertoast.showToast(msg: "Login Berhasil");

        if(loginModel?.data?.role == 'client'){
          Get.offAllNamed("/userDashboard");
        } else if(loginModel?.data?.role == 'tailor') {
          Get.offAllNamed("/tailorDashboard");
        }
        update();
      }
    } catch (e) {
      isLoading = false;
      Fluttertoast.showToast(
          msg: loginModel?.meta?.message ?? "Login Gagal");
      // Fluttertoast.showToast(msg: e.toString());
    }
  }
}
