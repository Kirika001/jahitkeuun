import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/card_pesanan.dart';
import 'package:jahitkeeun/reusable/customdivider.dart';
import 'package:jahitkeeun/ui/user/pesanan/pesanan_controller.dart';

class PesananScreen extends StatefulWidget {
  const PesananScreen({Key? key}) : super(key: key);

  @override
  State<PesananScreen> createState() => _PesananScreenState();
}

class _PesananScreenState extends State<PesananScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 10, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PesananController>(
        init: PesananController(),
        builder: (controller) {
          return controller.clientOrderModel != null
              ? Column(
            children: [
              SafeArea(child: Container()),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed('/search'),
                      child: Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10),
                        width: Get.width - 70,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Cari penjahit, item atau jasa'),
                            Icon(Icons.search)
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () => Get.toNamed('keranjang'),
                        icon: Icon(Icons.shopping_cart))
                  ],
                ),
              ),
              TabBar(
                controller: tabController,
                labelStyle: mainTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                labelColor: whiteColor,
                isScrollable: true,
                indicatorColor: mainColor,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    color: mainColor),
                unselectedLabelColor: darkColor,
                // backgroundColor: mainColor,
                // unselectedBackgroundColor: Colors.transparent,
                // borderWidth: 1,
                // unselectedBorderColor: darkColor,
                // contentPadding: EdgeInsets.symmetric(horizontal: 10),
                tabs: [
                  Tab(
                    text: "Semua Pesanan",
                  ),
                  Tab(
                    text: "Belum Bayar",
                  ),
                  Tab(
                    text: "Pembayaran Terkonfirmasi",
                  ),
                  Tab(
                    text: "Menunggu Pickup",
                  ),
                  Tab(
                    text: "Dalam Pengambilan",
                  ),
                  Tab(
                    text: "Proses Jahit",
                  ),
                  Tab(
                    text: "Dalam Pengantaran",
                  ),
                  Tab(
                    text: "Tambahan Biaya",
                  ),
                  Tab(
                    text: "Diterima",
                  ),
                  Tab(
                    text: "Selesai",
                  ),
                ],
              ),
              CustomDivider(
                color: mainColor,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    controller.clientOrderModel!.data!.data! != null
                        ? SingleChildScrollView(
                      child: Column(
                          children: controller
                              .clientOrderModel!.data!.data!
                              .map((e) =>
                              PesananCard(
                                idPesanan: int.parse(e.id ?? '0'),
                                statusPesanan: e.paymentStatus,
                                namaPenjahit: e.namapenjahit,
                                invoice: '${e.tglOrder}',
                                itemImg:
                                '$fotoClient/${e.photoClient1}',
                                jumlahItem:
                                int.parse(e.quantity!),
                                grandTotal: int.parse(
                                    e.price
                                        ?.split('.')
                                        .first ??
                                        ''),
                                namaJasa: e.jasa,
                                namaItem: e.namaitem ??
                                    'nama item gk muncul',
                              ))
                              .toList()),
                    )
                        : Center(child: Text('Data Kosong')),
                    controller.clientOrderModel!.data!.data!
                        .where((element) =>
                    element.paymentStatus == 'BELUM BAYAR')
                        .isNotEmpty
                        ? SingleChildScrollView(
                      child: Column(
                          children: controller
                              .clientOrderModel!.data!.data!
                              .where((element) =>
                          element.paymentStatus ==
                              'BELUM BAYAR')
                              .map((e) =>
                              PesananCard(
                                idPesanan: int.parse(e.id ?? '0'),
                                statusPesanan: e.paymentStatus,
                                namaPenjahit: e.namapenjahit,
                                invoice: '${e.tglOrder}',
                                // itemImg: '$categoryImg/${e.}',
                                jumlahItem:
                                int.parse(e.quantity!),
                                grandTotal: int.parse(
                                    e.price
                                        ?.split('.')
                                        .first ??
                                        ''),
                                namaJasa: e.jasa,
                                namaItem: e.namaitem ??
                                    'nama item gk muncul',
                              ))
                              .toList()),
                    )
                        : Center(
                      child: Text('Data Kosong'),
                    ),
                    controller.clientOrderModel!.data!.data!
                        .where((element) =>
                    element.paymentStatus == 'KONFIMASI PENJAHIT')
                        .isNotEmpty
                        ? SingleChildScrollView(
                      child: Column(
                          children: controller
                              .clientOrderModel!.data!.data!
                              .where((element) =>
                          element.paymentStatus == 'KONFIMASI PENJAHIT')
                              .map((e) =>
                              PesananCard(
                                idPesanan: int.parse(e.id ?? '0'),
                                statusPesanan: e.paymentStatus,
                                namaPenjahit: e.namapenjahit,
                                invoice: '${e.tglOrder}',
                                // itemImg: '$categoryImg/${e.}',
                                jumlahItem:
                                int.parse(e.quantity!),
                                grandTotal: int.parse(
                                    e.price
                                        ?.split('.')
                                        .first ??
                                        ''),
                                namaJasa: e.jasa,
                                namaItem: e.namaitem ??
                                    'nama item gk muncul',
                              ))
                              .toList()),
                    )
                        : Center(
                      child: Text('Data Kosong'),
                    ),
                    controller.clientOrderModel!.data!.data!
                        .where((element) =>
                    element.paymentStatus ==
                        'MENUNGGU PICKUP')
                        .isNotEmpty
                        ? SingleChildScrollView(
                      child: Column(
                        children: controller
                            .clientOrderModel!.data!.data!
                            .where((element) =>
                        element.paymentStatus ==
                            'MENUNGGU PICKUP')
                            .map((e) =>
                            PesananCard(
                              idPesanan: int.parse(e.id ?? '0'),
                                statusPesanan: e.paymentStatus,
                            ))
                            .toList(),
                      ),
                    )
                        : Center(child: Text('Data Kosong')),
                    controller.clientOrderModel!.data!.data!
                        .where((element) =>
                    element.paymentStatus ==
                        'DALAM PENGAMBILAN')
                        .isNotEmpty
                        ? SingleChildScrollView(
                      child: Column(
                          children: controller
                              .clientOrderModel!.data!.data!
                              .where((element) =>
                          element.paymentStatus ==
                              'DALAM PENGAMBILAN')
                              .map((e) =>
                              PesananCard(
                                idPesanan: int.parse(e.id ?? '0'),
                                statusPesanan: e.paymentStatus,
                                namaPenjahit: e.namapenjahit,
                                invoice: '${e.tglOrder}',
                                // itemImg: '$categoryImg/${e.}',
                                jumlahItem:
                                int.parse(e.quantity!),
                                grandTotal: int.parse(
                                    e.price
                                        ?.split('.')
                                        .first ??
                                        ''),
                                namaJasa: e.jasa,
                                namaItem: e.namaitem ??
                                    'nama item gk muncul',
                              ))
                              .toList()),
                    )
                        : Center(
                      child: Text('Data Kosong'),
                    ),
                    controller.clientOrderModel!.data!.data!
                        .where((element) =>
                    element.paymentStatus ==
                        'SEDANG DIKERJAKAN')
                        .isNotEmpty
                        ? SingleChildScrollView(
                      child: Column(
                          children: controller
                              .clientOrderModel!.data!.data!
                              .where((element) =>
                          element.paymentStatus ==
                              'SEDANG DIKERJAKAN')
                              .map((e) =>
                              PesananCard(
                                idPesanan: int.parse(e.id ?? '0'),
                                statusPesanan: e.paymentStatus,
                                namaPenjahit: e.namapenjahit,
                                invoice: '${e.tglOrder}',
                                // itemImg: '$categoryImg/${e.}',
                                jumlahItem:
                                int.parse(e.quantity!),
                                grandTotal: int.parse(
                                    e.price
                                        ?.split('.')
                                        .first ??
                                        ''),
                                namaJasa: e.jasa,
                                namaItem: e.namaitem ??
                                    'nama item gk muncul',
                              ))
                              .toList()),
                    )
                        : Center(
                      child: Text('Data Kosong'),
                    ),
                    controller.clientOrderModel!.data!.data!
                        .where((element) =>
                    element.paymentStatus ==
                        'DALAM PENGIRIMAN')
                        .isNotEmpty
                        ? SingleChildScrollView(
                      child: Column(
                          children: controller
                              .clientOrderModel!.data!.data!
                              .where((element) =>
                          element.paymentStatus ==
                              'DALAM PENGIRIMAN')
                              .map((e) =>
                              PesananCard(
                                idPesanan: int.parse(e.id ?? '0'),
                                statusPesanan: e.paymentStatus,
                                namaPenjahit: e.namapenjahit,
                                invoice: '${e.tglOrder}',
                                // itemImg: '$categoryImg/${e.}',
                                jumlahItem:
                                int.parse(e.quantity!),
                                grandTotal: int.parse(
                                    e.price
                                        ?.split('.')
                                        .first ??
                                        ''),
                                namaJasa: e.jasa,
                                namaItem: e.namaitem ??
                                    'nama item gk muncul',
                              ))
                              .toList()),
                    )
                        : Center(
                      child: Text('Data Kosong'),
                    ),
                    controller.clientOrderModel!.data!.data!
                        .where((element) =>
                    element.paymentStatus == 'TAMBAHAN BIAYA')
                        .isNotEmpty
                        ? SingleChildScrollView(
                      child: Column(
                          children: controller
                              .clientOrderModel!.data!.data!
                              .where((element) =>
                          element.paymentStatus ==
                              'TAMBAHAN BIAYA')
                              .map((e) =>
                              PesananCard(
                                idPesanan: int.parse(e.id ?? '0'),
                                statusPesanan: e.paymentStatus,
                                namaPenjahit: e.namapenjahit,
                                invoice: '${e.tglOrder}',
                                // itemImg: '$categoryImg/${e.}',
                                jumlahItem:
                                int.parse(e.quantity!),
                                grandTotal: int.parse(
                                    e.price
                                        ?.split('.')
                                        .first ??
                                        ''),
                                namaJasa: e.jasa,
                                namaItem: e.namaitem ??
                                    'nama item gk muncul',
                              ))
                              .toList()),
                    )
                        : Center(
                      child: Text('Data Kosong'),
                    ),
                    controller.clientOrderModel!.data!.data!
                        .where((element) =>
                    element.paymentStatus == 'DITERIMA')
                        .isNotEmpty
                        ? SingleChildScrollView(
                      child: Column(
                          children: controller
                              .clientOrderModel!.data!.data!
                              .where((element) =>
                          element.paymentStatus ==
                              'DITERIMA')
                              .map((e) =>
                              PesananCard(
                                idPesanan: int.parse(e.id ?? '0'),
                                statusPesanan: e.paymentStatus,
                                namaPenjahit: e.namapenjahit,
                                invoice: '${e.tglOrder}',
                                // itemImg: '$categoryImg/${e.}',
                                jumlahItem:
                                int.parse(e.quantity!),
                                grandTotal: int.parse(
                                    e.price
                                        ?.split('.')
                                        .first ??
                                        ''),
                                namaJasa: e.jasa,
                                namaItem: e.namaitem ??
                                    'nama item gk muncul',
                              ))
                              .toList()),
                    )
                        : Center(
                      child: Text('Data Kosong'),
                    ),
                    controller.clientOrderModel!.data!.data!
                        .where((element) =>
                    element.paymentStatus == 'LUNAS')
                        .isNotEmpty
                        ? SingleChildScrollView(
                      child: Column(
                          children: controller
                              .clientOrderModel!.data!.data!
                              .where((element) =>
                          element.paymentStatus ==
                              'LUNAS')
                              .map((e) =>
                              PesananCard(
                                idPesanan: int.parse(e.id ?? '0'),
                                statusPesanan: e.paymentStatus,
                                namaPenjahit: e.namapenjahit,
                                invoice: '${e.tglOrder}',
                                jumlahItem:
                                int.parse(e.quantity!),
                                grandTotal: int.parse(
                                    e.price
                                        ?.split('.')
                                        .first ??
                                        ''),
                                namaJasa: e.jasa,
                                namaItem: e.namaitem ??
                                    'nama item gk muncul',
                              ))
                              .toList()),
                    )
                        : Center(
                      child: Text('Data Kosong'),
                    ),
                  ],
                ),
              ),
            ],
          )
              : Center(
            child: CircularProgressIndicator.adaptive(),
          );
        });
  }
}
