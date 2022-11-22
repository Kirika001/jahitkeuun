import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/card_category.dart';
import 'package:jahitkeeun/reusable/card_tailor.dart';
import 'package:jahitkeeun/ui/user/home/home_controller.dart';
import 'package:jahitkeeun/data/model/tailor_model.dart' as tailor;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    ///start section search
                    SafeArea(child: Container()),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Get.toNamed('/search'),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: Get.width - 68,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Cari penjahit, item atau jasa'),
                                  Icon(Icons.search),
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

                    ///section alamat
                    ListTile(
                      onTap: () => Get.toNamed('/alamat'),
                      leading: Icon(Icons.location_on),
                      title: Text("Dikirim ke/Dijemput di:"),
                      subtitle: Text(
                        controller.currentAddress?.data?[0].alamat ??
                            'Memuat...',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(Icons.arrow_right),
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
                      carouselController: controller.carouselController,
                    ),
                    ListTile(
                      title: Text('\nPilihan jahit', style: titleTextStyle),
                      // trailing: Text('lihat semua',
                      //     style: labelTextStyle.copyWith(
                      //         color: secondaryColor, fontSize: 15)),
                    ),
                    controller.categoryModel != null
                        ? SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              height: 100,
                              child: Row(
                                children: controller.categoryModel!.data!.data!
                                    .map((e) => CategoryCard(
                                          img: '$categoryImg/${e.itemPhoto}',
                                          title: e.itemName,
                                          onTap: () => Get.toNamed(
                                            '/listPenjahit',
                                            arguments: int.parse(e.itemId!),
                                            // arguments: 1,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                    ListTile(
                      title: Text('\nPenjahit Kami', style: titleTextStyle),
                      // trailing: Text('lihat semua',
                      //     style: labelTextStyle.copyWith(
                      //         color: secondaryColor, fontSize: 15)),
                    ),
                  ],
                ),
              ),
              PagedSliverList(
                pagingController: controller.pagingController,
                builderDelegate: PagedChildBuilderDelegate<tailor.Data2?>(
                  itemBuilder: (context, item, index) {

                    return TailorCard(
                      idPenjahit: int.parse(
                          controller.tailorModel?.data?.data?[index].taylorId ??
                              "0"),
                      namaPenjahit: controller.tailorModel?.data?.data?[index]
                          .taylorName!.capitalizeFirst,
                      // e.taylorPhoto,
                      lokasiPenjahit: controller.tailorModel?.data?.data?[index]
                          .districtName!.capitalizeFirst,
                      rating: double.parse(controller
                              .tailorModel?.data?.data?[index].taylorRating ??
                          '0'),
                      totalOrder: int.parse(controller
                              .tailorModel?.data?.data?[index].taylorComtrans ??
                          '0'),
                      fotoProfil: controller.tailorModel?.data?.data?[index]
                                  .taylorPhoto !=
                              'avatar.png'
                          ? '$fotoProfil/${controller.tailorModel?.data?.data?[index].taylorPhoto}'
                          : profilImg,
                    );
                  },
                ),
              )
            ],
          );
        });
  }
}
