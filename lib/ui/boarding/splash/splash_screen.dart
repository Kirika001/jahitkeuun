import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/reusable/customlogo.dart';
import 'package:jahitkeeun/ui/boarding/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (context) {
        return Scaffold(
          backgroundColor: mainColor,
          body: Center(
            child: Image.asset('assets/logo.png', height: 150)
          ),
        );
      }
    );
  }
}
