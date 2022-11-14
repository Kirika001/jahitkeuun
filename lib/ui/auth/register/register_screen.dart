import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/customfilledbutton.dart';
import 'package:jahitkeeun/ui/auth/register/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: lightColor,
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.key,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Selamat datang!",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        Text("Ayo isi data-data berikut ini\n"),
                        TextFormField(
                          controller: controller.nameController,
                          decoration: const InputDecoration(
                            // label: Text("Nama"),
                            hintText: "Nama",
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Nama Kosong";
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: controller.emailController,
                          decoration: const InputDecoration(
                            // label: Text("Email"),
                            hintText: "Email",
                            prefixIcon: Icon(Icons.person),
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
                            prefixIcon: Icon(Icons.lock),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password Kosong";
                            } else if (value.length < 8) {
                              return "Password harus terdiri dari 8 karakter";
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomFilledButton(
                          title: 'Daftar',
                          color: mainColor,
                          onPressed: () {
                            if (controller.key.currentState?.validate() ==
                                true) {
                              print("OK");
                              controller.doRegister(
                                controller.nameController.text,
                                controller.emailController.text,
                                controller.usernameController.text,
                                controller.passwordController.text,
                              );
                            }
                          },
                        ),
                        Center(child: Text("atau", style: mainTextStyle)),
                        CustomFilledButton(
                          title: 'Sudah Punya Akun!',
                          color: darkColor,
                          onPressed: () => Get.offAndToNamed('/login'),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
