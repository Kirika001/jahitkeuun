import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/ui/user/profil/profil_controller.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilController>(
      init: ProfilController(),
      builder: (controller) {
        return ListView(
          children: [
            SafeArea(child: Container()),
            AppBar(
              title: Text("Profile"),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(profilImg),
                    radius: 60,
                  ),
                  Text(" Nama User", style: titleTextStyle,)
                ],
              ),
            ),
          ],
        );
      }
    );
  }
}
