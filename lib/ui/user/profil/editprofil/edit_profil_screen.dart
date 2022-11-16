import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/customfilledbutton.dart';
import 'package:jahitkeeun/ui/user/profil/editprofil/edit_profil_controller.dart';

class EditProfilScreen extends StatelessWidget {
  const EditProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfilController>(
      init: EditProfilController(),
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Profil'),
          ),
          body: SingleChildScrollView(
            child: Form(
              // key: controller.key,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("Selamat datang!",
                    //     style: TextStyle(
                    //         fontSize: 30, fontWeight: FontWeight.bold)),
                    // Text("Ayo isi data-data berikut ini\n"),
                    TextFormField(
                      // controller: controller.nameController,
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
                      // controller: controller.emailController,
                      decoration: const InputDecoration(
                        // label: Text("Email"),
                        hintText: "Email",
                        prefixIcon: Icon(Icons.mail),
                      ),
                      validator: (value) {
                        // if (value == null || value.isEmpty) {
                        //   return "Email Kosong";
                        // } else if (EmailValidator.validate(value) ==
                        //     false) {
                        //   return "contoh email : name@mail.com";
                        // }
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      // controller: controller.passwordController,
                      decoration: const InputDecoration(
                        // label: Text("Password"),
                        hintText: "Nomor Telpon",
                        prefixIcon: Icon(Icons.phone_android_sharp),
                      ),
                      validator: (value) {
                        // if (value == null || value.isEmpty) {
                        //   return "Password Kosong";
                        // } else if (value.length < 8) {
                        //   return "Password harus terdiri dari 8 karakter";
                        // }
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomFilledButton(
                      title: 'Edit Profil',
                      color: darkColor,
                      onPressed: () {
                        // if (controller.key.currentState?.validate() ==
                        //     true) {
                        //   print("OK");
                        //   controller.doRegister(
                        //     controller.nameController.text,
                        //     controller.emailController.text,
                        //     controller.usernameController.text,
                        //     controller.passwordController.text,
                        //   );
                        // }
                      },
                    ),

                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
