import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/customfilledbutton.dart';
import 'package:jahitkeeun/ui/auth/lupapassword/lupapassword_controller.dart';

class LupaPasswordScreen extends StatelessWidget {
  const LupaPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LupaPasswordController>(
      init: LupaPasswordController(),
      builder: (context) {
        return Scaffold(
          backgroundColor: lightColor,
          appBar: AppBar(
            title: Text('Lupa Password'),
          ),
          body:  Form(
            // key: controller.key,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Lupa Password?",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  Text("Silahkan masukan email untuk melakukan reset password\n"),
                  TextFormField(
                    // controller: controller.usernameController,
                    decoration: const InputDecoration(
                      // label: Text("Email"),
                      hintText: "Email",
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Emaiil Kosong";
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  CustomFilledButton(
                    title: 'Kirim',
                    color: darkColor,
                    onPressed: () {
                      // if (controller.key.currentState?.validate() ==
                      //     true) {
                      //   print("OK");
                      //   controller.doLogin(
                      //       controller.usernameController.text,
                      //       controller.passwordController.text);
                      // }
                      Get.toNamed('/userDashboard');
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
