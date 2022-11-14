import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  // final Repository repository = Get.find<Repository>();

  // RegisterModel? registerModel;
  
  final key = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void onInit() {
    super.onInit();

    nameController.text;
    emailController.text;
    usernameController.text;
    passwordController.text;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  void doRegister(String name, String email, String username, String password) async {
    // try{
    //   var response = await repository.postRegister(name, email, username, password);
    //   registerModel = response;
    //   // Fluttertoast.showToast(msg: registerModel?.meta?.message ?? "");
    //
    //   if(registerModel?.meta?.status == 'success'){
    //     Fluttertoast.showToast(msg: "Register Berhasil");
    //     Get.toNamed("/login");
    //   } else {
    //     Fluttertoast.showToast(msg: registerModel?.meta?.message ?? "");
    //   }
    //
    // } catch (e){
    //   Fluttertoast.showToast(msg: registerModel?.meta?.message ?? "data tidak lengkap");
    //   // Fluttertoast.showToast(msg: e.toString());
    // }

  }
}
