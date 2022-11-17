import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/customfilledbutton.dart';
import 'package:jahitkeeun/ui/user/profil/profil_controller.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilController>(
        init: ProfilController(),
        builder: (controller) {
          return Column(
            children: [
              // AppBar(
              //   actions: [
              //     IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
              //   ],
              // ),
              Stack(
                children: [
                  Container(
                    height: 250,
                    color: mainColor,
                  ),
                  Positioned(
                    right: 0,
                    child: SafeArea(
                      child: SvgPicture.asset(
                        "assets/svg/decoration2.svg",
                        width: Get.width,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 25, right: 10,
                      child: IconButton(
                          icon: Icon(
                              Icons.shopping_cart, color: darkColor, size: 25),
                          onPressed: () {}
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0, left: 20),
                    child: Text("My Profile",
                        style: titleTextStyle.copyWith(color: whiteColor)),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 150, left: 20, right: 20),
                    child: Container(
                      padding: const EdgeInsets.only(top: 80),
                      height: 180,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text('Nama User', style: titleTextStyle),
                          CustomFilledButton(
                            color: Colors.transparent,
                            width: 200,
                            borderColor: darkColor,
                            fontColor: darkColor,
                            title: 'Edit Profil',
                            icon: Icons.edit,
                            onPressed: () => Get.toNamed('/editProfil'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 30,
                    child: SafeArea(
                      child: SvgPicture.asset(
                        "assets/svg/decoration1.svg",
                        width: 80,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 90, horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset:
                              Offset(5, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(profilImg),
                          radius: 60,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\n   Pengaturan',
                        style: titleTextStyle,
                      ),
                      ListTile(
                        title: Text('Telpon', style: listTitleTextStyle),
                        leading: Icon(Icons.phone_android),
                        trailing:
                        Text('08x-xxxx-xxxx', style: subtitleTextStyle),
                      ),
                      ListTile(
                        title: Text('Email', style: listTitleTextStyle),
                        leading: Icon(Icons.mail),
                        trailing:
                        Text('user@mail.com', style: subtitleTextStyle),
                      ),
                      ListTile(
                        title: Text('Alamat', style: listTitleTextStyle),
                        leading: Icon(Icons.location_on),
                        trailing: Text('Alamat', style: subtitleTextStyle),
                        onTap: () => Get.toNamed('/alamat'),
                      ),
                      ListTile(
                        title: Text(
                            'Ganti Password', style: listTitleTextStyle),
                        leading: Icon(Icons.lock),
                        trailing: Text('* * * *', style: subtitleTextStyle),
                        onTap: () => Get.toNamed('/gantiPassword'),
                      ),

                      Text('   Tentang Aplikasi', style: titleTextStyle),
                      ListTile(
                        title: Text(
                            'Versi Aplikasi', style: listTitleTextStyle),
                        leading: Icon(Icons.history),
                        trailing: Text('1.0.0', style: subtitleTextStyle),
                      ),
                      ListTile(
                        title: Text('Tentang Kami', style: listTitleTextStyle),
                        leading: Icon(Icons.info),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () => Get.toNamed('/about'),
                      ),
                      Text('   Akun', style: titleTextStyle),
                      ListTile(
                        title: Text('Daftar Sebagai penjahit',
                            style: listTitleTextStyle),
                        leading: Image.asset(
                            "assets/sewing-machine.png", height: 25),
                        trailing: Icon(Icons.chevron_right),
                      ),
                      ListTile(
                        title: Text('Hapus Akun',
                            style: listTitleTextStyle.copyWith(
                                color: errorColor)),
                        leading: Icon(Icons.delete, color: errorColor),
                        trailing: Icon(Icons.chevron_right, color: errorColor),
                      ),

                      ListTile(
                        title: Text('Keluar',
                            style: listTitleTextStyle.copyWith(
                                color: errorColor)),
                        leading: Icon(
                          Icons.logout,
                          color: errorColor,
                        ),
                        trailing: Icon(Icons.chevron_right, color: errorColor),
                        onTap: () => controller.logout(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
