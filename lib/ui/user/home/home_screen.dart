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
                      child: Column(
                        children: [
                          controller.currentAddress != null ? ListTile(
                            onTap: () => Get.toNamed('/alamat'),
                            leading: Icon(Icons.location_on),
                            title: Text("Dikirim ke/Dijemput di:"),
                            subtitle: Text(
                              controller
                                  .currentAddress?.data?[0].alamat ??
                                  '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: const Icon(Icons.arrow_right),
                          ) : const Center(child: CircularProgressIndicator.adaptive()),
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
                          controller.categoryModel != null ? SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              height: 100,
                              child: Row(
                                children:
                                controller.categoryModel!.data!.data!
                                    .map((e) => CategoryCard(
                                  img:
                                  '$categoryImg/${e.itemPhoto}',
                                  title: e.itemName,
                                  onTap: () => Get.toNamed(
                                    '/listPenjahit',
                                    arguments:
                                    int.parse(e.itemId!),
                                    // arguments: 1,
                                  ),
                                ))
                                    .toList(),
                              ),
                            ),
                          ) : const Center(child: CircularProgressIndicator.adaptive(),),
                          ListTile(
                            title: Text('Penjahit Kami'),
                            trailing: Text(
                              'Sort by',
                              style: labelTextStyle.copyWith(
                                  color: secondaryColor, fontSize: 15),
                            ),
                          ),
                          controller.tailorModel != null ? Column(
                            children: controller.tailorModel!.data?.data
                                ?.map((e) => TailorCard(
                              idPenjahit: int.parse(e.taylorId ?? "0"),
                              namaPenjahit:
                              e.taylorName!.capitalizeFirst,
                              // e.taylorPhoto,
                              lokasiPenjahit:
                              e.districtName!.capitalizeFirst,
                              rating:
                              double.parse(e.taylorRating!),
                              totalOrder: int.parse(
                                  e.taylorComtrans ?? '0'),
                              fotoProfil: e.taylorPhoto !=
                                  'avatar.png'
                                  ? '$fotoProfil/${e.taylorPhoto}'
                                  : profilImg,
                            ))
                                .toList() ?? [],
                          ) : const Center(child: CircularProgressIndicator.adaptive(),)
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}
