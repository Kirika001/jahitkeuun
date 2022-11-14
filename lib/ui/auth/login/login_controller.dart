import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // final Repository repository = Get.find<Repository>();
  // final storage = StorageCore();

  // LoginModel? loginModel;

  final key = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    usernameController.text;
    passwordController.text;
  }

  @override
  void dispose() {
    super.dispose();

    usernameController.dispose();
    passwordController.dispose();
  }

  void doLogin(String email, String password) async {
    // try {
    //   var response =
    //       await repository.postLogin(email, password);
    //   loginModel = response;
    //
    //   if (loginModel?.meta?.status == 'success') {
    //     storage.saveAuthResponse(response);
    //     print(storage.getAccessToken());
    //     Fluttertoast.showToast(msg: "Login Berhasil");
    //     update();
    //     Get.offAllNamed("/article");
    //   } else {
    //     Fluttertoast.showToast(msg: loginModel!.meta!.message!);
    //   }
    // } catch (e) {
    //   Fluttertoast.showToast(
    //       msg: loginModel?.meta?.message ?? "Login Gagal");
    //   // Fluttertoast.showToast(msg: e.toString());
    // }
  }
}
