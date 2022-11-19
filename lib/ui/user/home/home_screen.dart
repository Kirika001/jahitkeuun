import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/card_category.dart';
import 'package:jahitkeeun/reusable/card_tailor.dart';
import 'package:jahitkeeun/ui/user/home/home_controller.dart';
import 'package:jahitkeeun/data/model/category_model.dart' as category;

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
                      onTap: () => Get.toNamed('/search'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: Get.width - 68,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
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
                        onPressed: () => Get.toNamed('/keranjang'),
                        icon: Icon(Icons.shopping_cart))
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: controller.isLoading == false ? Column(
                        children: [
                          ListTile(
                            onTap: () => Get.toNamed('/alamat'),
                            leading: Icon(Icons.location_on),
                            title: Text("Dikirim ke/Dijemput di:"),
                            subtitle: Text(
                              controller.currentAddress?.data?[0].alamat ??
                                  '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Icon(Icons.arrow_right),
                          ),
                          CarouselSlider(
                            items: controller.image,
                            options: CarouselOptions(
                                autoPlay: true,
                                viewportFraction: 1,
                                enableInfiniteScroll: false,
                                // height: 200,
                                onPageChanged: (index, reason) =>
                                controller.currentIndex),
                            carouselController:
                            controller.carouselController,
                          ),
                          ListTile(
                            title: Text('Pilihan jahit'),
                            trailing: Text('lihat semua',
                                style: labelTextStyle.copyWith(
                                    color: secondaryColor, fontSize: 15)),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              height: 100,
                              child: Row(
                                children:
                                controller.categoryModel!.data!.data!
                                    .map((e) =>
                                    CategoryCard(
                                      img:
                                      'https://apijahitkeeun.tepat.co.id/photo-item/${e
                                          .itemPhoto}',
                                      title: e.itemName,
                                      onTap: () =>
                                          Get.toNamed(
                                              '/listPenjahit', arguments: int
                                              .parse(e.itemId!)),
                                    ))
                                    .toList(),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Penjahit Kami'),
                            trailing: Text(
                              'Sort by',
                              style: labelTextStyle.copyWith(
                                  color: secondaryColor, fontSize: 15),
                            ),
                          ),
                          Column(
                            children: controller.tailorModel!.data!
                                .map((e) =>
                                TailorCard(
                                  idPenjahit: int.parse(e.taylorId!),
                                  namaPenjahit:
                                  e.taylorName!.capitalizeFirst,
                                  lokasiPenjahit:
                                  e.districtName!.capitalizeFirst,
                                  rating: double.parse(e.taylorRating!),
                                  totalOrder: e.taylorComtrans ?? 0,
                                  fotoProfil: e.taylorPhoto ==
                                      'avatar.png'
                                      ? profilImg
                                      : 'https://apijahitkeeun.tepat.co.id/photo-user/${e
                                      .taylorPhoto}',
                                ))
                                .toList(),
                          )
                        ],
                      ) : Center(child: CircularProgressIndicator.adaptive()),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}
