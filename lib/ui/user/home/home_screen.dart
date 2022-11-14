import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/card_category.dart';
import 'package:jahitkeeun/reusable/card_tailor.dart';
import 'package:jahitkeeun/ui/user/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Column(
            children: [
              SafeArea(child: Container()),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      width: Get.width - 70,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari penjahit, item atau jasa',
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart)
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text("Dikirim ke/Dijemput di:"),
                        subtitle: Text("user address"),
                        trailing: Icon(Icons.arrow_right),
                      ),
                      CarouselSlider(
                        items: controller.image,
                        options: CarouselOptions(
                            autoPlay: true,
                            viewportFraction: 1,
                            enableInfiniteScroll: false,
                            // height: 200,
                            onPageChanged: (index, reason) => controller.currentIndex),
                        carouselController: controller.carouselController,
                      ),
                      ListTile(
                        title: Text('Pilihan jahit'),
                        trailing: Text('liht semua',
                            style: mainTextStyle.copyWith(color: mainColor)),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:SizedBox(
                          height: 150,
                          child: Row(
                            children: [
                              CategoryCard(img: blouseImg, title: 'Blouse'),
                              CategoryCard(img: dressminImg, title: 'Dress Pendek'),
                              CategoryCard(img: gamisImg, title: 'Gamis'),
                              CategoryCard(img: kerudungImg, title: 'Kerudung'),
                              CategoryCard(img: pantImg, title: 'Celana'),
                              CategoryCard(img: skirtImg, title: 'Rok'),
                              CategoryCard(img: kemejaImg, title: 'Kemeja'),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text('Penjahit Kami'),
                        trailing: Text('Short by', style: mainTextStyle.copyWith(color: mainColor),),
                      ),
                      TailorCard(),
                      TailorCard(),
                      TailorCard(),
                      TailorCard(),
                      TailorCard(),
                      TailorCard(),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
    );
  }
}
