import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/card_review.dart';
import 'package:jahitkeeun/reusable/card_tailor.dart';
import 'package:jahitkeeun/reusable/customfilledbutton.dart';
import 'package:jahitkeeun/reusable/item_category.dart';
import 'package:jahitkeeun/ui/user/search/detil/detil_penjahit_controller.dart';

class DetilPenjahitScreen extends StatelessWidget {
  const DetilPenjahitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetilPenjahitController>(
        init: DetilPenjahitController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Detil Penjahit'),
            ),
            body: controller.isLoading == false
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TailorCard(
                          color: Colors.transparent,
                          elevation: 0,
                          namaPenjahit: controller.tailorDetailModel?.meta
                              ?.message?.data?.first.taylorName,
                          lokasiPenjahit: controller.tailorDetailModel?.meta
                              ?.message?.data?.first.districtName,
                          totalOrder: controller.tailorDetailModel?.meta
                                  ?.message?.data?.first.completedTransaction ??
                              0,
                          rating: double.parse(controller.tailorDetailModel
                                  ?.meta?.message?.data?.first.rating ??
                              '0'),
                          // fotoProfil: controller.tailorDetailModel?.meta
                          //             ?.message?.data?.first.taylorPhoto ==
                          //         'avatar.png'
                          //     ? profilImg
                          //     : '$fotoProfil/${controller.tailorDetailModel?.meta?.message?.data?.first.taylorPhoto}',
                        ),
                        // Text(controller.tailorDetailModel?.meta?.message?.data
                        //         ?.first.taylorId ??
                        //     ''),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        //   child: RichText(
                        //       textAlign: TextAlign.justify,
                        //       text: TextSpan(
                        //           text: 'Deskripsi Penjahit ${lorem}',
                        //           style: mainTextStyle.copyWith(color: darkColor))),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomFilledButton(
                                width: Get.width / 2 - 20,
                                height: 40,
                                color: darkColor,
                                title: 'Chat',
                                onPressed: () async => controller.chat(
                                    controller.tailorDetailModel?.meta?.message
                                            ?.data?.first.taylorPhone
                                            ?.substring(1) ??
                                        '0'),
                              ),
                              CustomFilledButton(
                                width: Get.width / 2 - 20,
                                height: 40,
                                color: Colors.transparent,
                                fontColor: darkColor,
                                borderColor: darkColor,
                                title: 'Lihat Portofolio',
                                onPressed: () => Get.toNamed('/portofolio',
                                    arguments: controller.tailorDetailModel
                                        ?.meta?.message?.data?.first.taylorId),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: CustomFilledButton(
                            title: 'Pesan Jasa',
                            color: mainColor,
                            onPressed: () =>
                                Get.toNamed('/pesanJasa', arguments: {
                              "tailorID": int.parse(controller.tailorDetailModel
                                      ?.meta?.message?.data?.first.taylorId ??
                                  ''),
                              "tailorName": controller.tailorDetailModel?.meta
                                      ?.message?.data?.first.taylorName ??
                                  '',
                              "itemID": 0
                            }),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5),
                          child: Text(
                              'Jassa ${controller.tailorDetailModel?.meta?.message?.data?.first.taylorName}',
                              style: titleTextStyle),
                        ),
                        Column(
                          children: controller.categoryTailorModel!.data!.data!
                              .map((e) => ItemCategory(
                                    onTap: () =>
                                        Get.toNamed('/pesanJasa', arguments: {
                                      "tailorID": int.parse(controller
                                              .tailorDetailModel
                                              ?.meta
                                              ?.message
                                              ?.data
                                              ?.first
                                              .taylorId ??
                                          ''),
                                      "tailorName": controller
                                              .tailorDetailModel
                                              ?.meta
                                              ?.message
                                              ?.data
                                              ?.first
                                              .taylorName ??
                                          '',
                                      "itemID": int.parse(e.itemId!)
                                    }),
                                    imgCategory: '$categoryImg/${e.itemPhoto}',
                                    namaCategory: e.itemName,
                                  ))
                              .toList(),
                        ),
                        // TextButton(
                        //     onPressed: () {},
                        //     child: Text("Lihat Jasa Lainnya",
                        //         style:
                        //             mainTextStyle.copyWith(color: darkColor))),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text('Review', style: titleTextStyle),
                        ),
                        ReviewCard()
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator.adaptive()),
          );
        });
  }
}
