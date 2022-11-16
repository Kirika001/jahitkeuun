import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/data/model/register_model.dart';

class RegisterController extends BaseController {

  RegisterModel? registerModel;
  
  final key = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void onInit() {
    super.onInit();

    nameController.text;
    emailController.text;
    passwordController.text;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void doRegister(String name, String email, String password) async {
    try{
      var response = await repository.postRegister(name, email, password);
      registerModel = response;
      Fluttertoast.showToast(msg: registerModel?.meta?.message ?? "");

      if(registerModel?.meta?.status == 'success'){
        Fluttertoast.showToast(msg: "Register Berhasil");
        Get.toNamed("/login");
      } else {
        Fluttertoast.showToast(msg: registerModel?.meta?.message ?? "");
      }

    } catch (e){
      Fluttertoast.showToast(msg: registerModel?.meta?.message ?? "data tidak lengkap");
      // Fluttertoast.showToast(msg: e.toString());
    }

  }
}
