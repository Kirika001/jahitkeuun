import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/data/model/login_model.dart';
import 'package:jahitkeeun/data/storage_core.dart';


class LoginController extends BaseController {
  final storage = StorageCore();

  LoginModel? loginModel;
  bool? isLoading;

  final key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    emailController.text;
    passwordController.text;
  }

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  void doLogin(String email, String password) async {

    try {
      isLoading = true;
      var response =
          await repository.postLogin(email, password);
      loginModel = response;

      if (loginModel?.meta?.status == 'success') {
        isLoading = false;
        storage.saveAuthResponse(response);
        print(storage.getAccessToken());
        Fluttertoast.showToast(msg: "Login Berhasil");
        update();
        
        if(storage.getCurrentUserRole() == 'client'){
          Get.offAllNamed("/userDashboard");  
        } else if(storage.getCurrentUserRole() == 'tailor') {
          Get.offAllNamed("/tailorDashboard");
        }
        
      } else {
        Fluttertoast.showToast(msg: loginModel!.meta!.message!);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: loginModel?.meta?.message ?? "Login Gagal");
      // Fluttertoast.showToast(msg: e.toString());
    }
  }
}
