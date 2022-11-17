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
                    GestureDetector(
                      onTap: ()=> Get.toNamed('/search'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: Get.width - 68,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Cari penjahit, item atau jasa'),
                            Icon(Icons.search)
                          ],
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                          trailing: Text('lihat semua',
                              style: labelTextStyle.copyWith(color: secondaryColor, fontSize: 15)),
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
                          trailing: Text('Sort by', style: labelTextStyle.copyWith(color: secondaryColor, fontSize: 15),),
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
              ),
            ],
          );
        }
    );
  }
}
