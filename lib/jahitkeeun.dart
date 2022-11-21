import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/ui/auth/login/login_screen.dart';
import 'package:jahitkeeun/ui/auth/lupapassword/lupapassword_screen.dart';
import 'package:jahitkeeun/ui/auth/register/register_screen.dart';
import 'package:jahitkeeun/ui/boarding/onboarding/onboarding_screen.dart';
import 'package:jahitkeeun/ui/boarding/splash/splash_screen.dart';
import 'package:jahitkeeun/ui/main/tailor_main_screen.dart';
import 'package:jahitkeeun/ui/main/user_main_screen.dart';
import 'package:jahitkeeun/ui/app/about/about_screen.dart';
import 'package:jahitkeeun/ui/user/profil/alamat/edit/edit_alamat_screen.dart';
import 'package:jahitkeeun/ui/user/profil/alamat/list_alamat_screen.dart';
import 'package:jahitkeeun/ui/user/profil/alamat/tambah/tambah_alamat_screen.dart';
import 'package:jahitkeeun/ui/user/profil/editprofil/edit_profil_screen.dart';
import 'package:jahitkeeun/ui/user/profil/gantipassword/gantipassword_screen.dart';
import 'package:jahitkeeun/ui/user/search/detil/detil_penjahit_screen.dart';
import 'package:jahitkeeun/ui/user/search/penjahit/list_penjahit_screen.dart';
import 'package:jahitkeeun/ui/user/search/search_screen.dart';
import 'package:jahitkeeun/ui/user/transaksi/checkout/checkout_screen.dart';
import 'package:jahitkeeun/ui/user/transaksi/detil/detil_transaksi_screen.dart';
import 'package:jahitkeeun/ui/user/transaksi/keranjang/keranjang_screen.dart';
import 'package:jahitkeeun/ui/user/transaksi/pesanjasa/pesan_jasa_screen.dart';


class Jahitkeeun extends StatelessWidget {
  const Jahitkeeun({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jahitkeuun',
      theme: ThemeData(
          backgroundColor: lightColor,
          colorScheme: ThemeData().colorScheme.copyWith(primary: mainColor),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            // contentPadding: EdgeInsets.only(left: 10),
            fillColor: whiteColor,
            border: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                    width: 2,
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
        GetPage(name: '/lupaPassword', page: () => const LupaPasswordScreen()),
        GetPage(name: '/userDashboard', page: ()=> const UserMainScreen()),
        GetPage(name: '/editProfil', page: ()=> const EditProfilScreen()),
        GetPage(name: '/alamat', page: ()=> const AlamatScreen()),
        GetPage(name: '/tambahAlamat', page: ()=> const TambahAlamatScreen()),
        GetPage(name: '/editAlamat', page: ()=> const EditAlamatScreen()),
        GetPage(name: '/gantiPassword', page: ()=> const GantiPasswordScreen()),
        GetPage(name: '/about', page: ()=> const AboutScreen()),
        GetPage(name: '/detilTransaksi', page: ()=> const DetilTransaksiScreen()),
        GetPage(name: '/search', page: ()=> const SearchScreen()),
        GetPage(name: '/listPenjahit', page: ()=> const ListPenjahitScreen()),
        GetPage(name: '/detilPenjahit', page: ()=> const DetilPenjahitScreen()),
        GetPage(name: '/pesanJasa', page: ()=> const PesanJasaScreen()),
        GetPage(name: '/keranjang', page: ()=> const KeranjangScreen()),
        GetPage(name: '/checkout', page: ()=> const CheckoutScreen()),
        GetPage(name: '/tailorDashboard', page: ()=> const TailorMainScreen()),
      ],
      initialRoute: '/',
    );
  }
}