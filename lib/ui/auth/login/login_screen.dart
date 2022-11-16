import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/customfilledbutton.dart';
import 'package:jahitkeeun/ui/auth/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) {
            return Center(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.key,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi, ketemu lagi...",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        Text("Silahkan login untuk melanjutkan\n"),
                        TextFormField(
                          controller: controller.emailController,
                          decoration: const InputDecoration(
                            // label: Text("Email"),
                            hintText: "Email",
                            prefixIcon: Icon(Icons.mail),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email Kosong";
                            } else if (EmailValidator.validate(value) ==
                                false) {
                              return "contoh email : name@mail.com";
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: controller.passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            // label: Text("Password"),
                              hintText: "Password",
                              prefixIcon: Icon(Icons.lock)
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password Kosong";
                            } else if (value.length < 8) {
                              return "Password harus terdiri dari 8 karakter";
                            }
                          },
                        ),
                        TextButton(
                            onPressed: ()=> Get.toNamed('/lupaPassword'),
                            child: Text("Lupa Password ?",style: mainTextStyle.copyWith(color: darkColor))
                        ),
                        CustomFilledButton(
                          title: 'Masuk',
                          color: mainColor,
                          onPressed: () {
                            if (controller.key.currentState?.validate() ==
                                true) {
                              controller.doLogin(
                                  controller.emailController.text,
                                  controller.passwordController.text);
                            }
                          },
                        ),
                        Center(child: Text("atau", style: mainTextStyle)),
                        CustomFilledButton(
                          title: 'Belum punya akun? Daftar disini',
                          color: darkColor,
                          onPressed: () => Get.offAndToNamed('/register'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
