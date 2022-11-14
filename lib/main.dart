import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/ui/auth/login/login_screen.dart';
import 'package:jahitkeeun/ui/auth/register/register_screen.dart';
import 'package:jahitkeeun/ui/boarding/onboarding/onboarding_screen.dart';
import 'package:jahitkeeun/ui/boarding/splash/splash_screen.dart';
import 'package:jahitkeeun/ui/main/tailor_main_screen.dart';
import 'package:jahitkeeun/ui/main/user_main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jahitkeuun',
      theme: ThemeData(
        backgroundColor: lightColor,
        colorScheme: ThemeData().colorScheme.copyWith(primary: darkColor),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: whiteColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 5,
              color: darkColor
            )
          ),
        )
      ),
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/onboarding', page: ()=> const OnboardingScreen()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/register', page: () => const RegisterScreen()),
        GetPage(name: '/userDashboard', page: ()=> const UserMainScreen()),
        GetPage(name: '/tailorDashboard', page: ()=> const TailorMainScreen()),
      ],
      initialRoute: '/userDashboard',
    );
  }
}

