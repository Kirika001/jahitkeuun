import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
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
    tabController = TabController(length: 9, vsync: this);
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
                          text: "Menunggu Pembayaran",
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
                          controller.clientOrderModel!.data!.data!
                                  .where((element) =>
                                      element.orderStatus ==
                                      'Menunggu Pembayaran')
                                  .isNotEmpty
                              ? SingleChildScrollView(
                                  child: Column(
                                      children: controller
                                          .clientOrderModel!.data!.data!
                                          .where((element) =>
                                              element.orderStatus ==
                                              'Menunggu Pembayaran')
                                          .map((e) => PesananCard(
                                                idPesanan:
                                                    int.parse(e.id ?? '0'),
                                                actionButton: () {
                                                  controller.updateOrder(
                                                      int.parse(e.id ?? '0'),
                                                      'Menunggu Konfirmasi');
                                                },
                                                statusPesanan:
                                                    e.orderStatus ?? '',
                                                namaPenjahit:
                                                    e.namapenjahit ?? '',
                                                invoice: '${e.tglOrder}',
                                                // itemImg: '$categoryImg/${e.}',
                                                jumlahItem: int.parse(
                                                    e.quantity ?? '0'),
                                                grandTotal: int.parse(
                                                    e.price?.split('.').first ??
                                                        ''),
                                                namaJasa: e.jasa ?? '',
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
                                      element.orderStatus ==
                                      'Menunggu Konfirmasi')
                                  .isNotEmpty
                              ? SingleChildScrollView(
                                  child: Column(
                                      children: controller
                                          .clientOrderModel!.data!.data!
                                          .where((element) =>
                                              element.orderStatus ==
                                              'Menunggu Konfirmasi')
                                          .map((e) => PesananCard(
                                                idPesanan:
                                                    int.parse(e.id ?? '0'),
                                                // actionButton: () {
                                                //   controller.updateOrder(
                                                //       int.parse(e.id ?? '0'),
                                                //       'Menunggu Pickup');
                                                // },
                                                statusPesanan: e.orderStatus,
                                                namaPenjahit: e.namapenjahit,
                                                invoice: '${e.tglOrder}',
                                                // itemImg: '$categoryImg/${e.}',
                                                jumlahItem:
                                                    int.parse(e.quantity!),
                                                grandTotal: int.parse(
                                                    e.price?.split('.').first ??
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
                                      element.orderStatus == 'Menunggu Pickup')
                                  .isNotEmpty
                              ? SingleChildScrollView(
                                  child: Column(
                                    children: controller
                                        .clientOrderModel!.data!.data!
                                        .where((element) =>
                                            element.orderStatus ==
                                            'Menunggu Pickup')
                                        .map((e) => PesananCard(
                                              idPesanan: int.parse(e.id ?? '0'),
                                              actionButton: () {
                                                controller.updateOrder(
                                                    int.parse(e.id ?? '0'),
                                                    'Dalam Pengambilan');
                                              },
                                              statusPesanan: e.orderStatus,
                                              namaPenjahit: e.namapenjahit,
                                              invoice: '${e.tglOrder}',
                                              // itemImg: '$categoryImg/${e.}',
                                              jumlahItem:
                                                  int.parse(e.quantity!),
                                              grandTotal: int.parse(
                                                  e.price?.split('.').first ??
                                                      ''),
                                              namaJasa: e.jasa,
                                              namaItem: e.namaitem ??
                                                  'nama item gk muncul',
                                            ))
                                        .toList(),
                                  ),
                                )
                              : Center(child: Text('Data Kosong')),
                          controller.clientOrderModel!.data!.data!
                                  .where((element) =>
                                      element.orderStatus ==
                                      'Dalam Pengambilan')
                                  .isNotEmpty
                              ? SingleChildScrollView(
                                  child: Column(
                                      children: controller
                                          .clientOrderModel!.data!.data!
                                          .where((element) =>
                                              element.orderStatus ==
                                              'Dalam Pengambilan')
                                          .map((e) => PesananCard(
                                                idPesanan:
                                                    int.parse(e.id ?? '0'),
                                                // actionButton: () {
                                                //   controller.updateOrder(
                                                //       int.parse(e.id ?? '0'),
                                                //       'Dalam Pengerjaan');
                                                // },
                                                statusPesanan: e.orderStatus,
                                                namaPenjahit: e.namapenjahit,
                                                invoice: '${e.tglOrder}',
                                                // itemImg: '$categoryImg/${e.}',
                                                jumlahItem:
                                                    int.parse(e.quantity!),
                                                grandTotal: int.parse(
                                                    e.price?.split('.').first ??
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
                                      element.orderStatus == 'Dalam Pengerjaan')
                                  .isNotEmpty
                              ? SingleChildScrollView(
                                  child: Column(
                                      children: controller
                                          .clientOrderModel!.data!.data!
                                          .where((element) =>
                                              element.orderStatus ==
                                              'Dalam Pengerjaan')
                                          .map((e) => PesananCard(
                                                idPesanan:
                                                    int.parse(e.id ?? '0'),
                                                // actionButton: () {
                                                //   controller.updateOrder(
                                                //       int.parse(e.id ?? '0'),
                                                //       'Dalam Perjalanan');
                                                // },
                                                statusPesanan: e.orderStatus,
                                                namaPenjahit: e.namapenjahit,
                                                invoice: '${e.tglOrder}',
                                                // itemImg: '$categoryImg/${e.}',
                                                jumlahItem:
                                                    int.parse(e.quantity!),
                                                grandTotal: int.parse(
                                                    e.price?.split('.').first ??
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
                                      element.orderStatus == 'Dalam Perjalanan')
                                  .isNotEmpty
                              ? SingleChildScrollView(
                                  child: Column(
                                      children: controller
                                          .clientOrderModel!.data!.data!
                                          .where((element) =>
                                              element.orderStatus ==
                                              'Dalam Perjalanan')
                                          .map((e) => PesananCard(
                                                idPesanan:
                                                    int.parse(e.id ?? '0'),
                                                actionButton: () {
                                                  controller.updateOrder(
                                                      int.parse(e.id ?? '0'),
                                                      'Diterima');
                                                },
                                                statusPesanan: e.orderStatus,
                                                namaPenjahit: e.namapenjahit,
                                                invoice: '${e.tglOrder}',
                                                // itemImg: '$categoryImg/${e.}',
                                                jumlahItem:
                                                    int.parse(e.quantity!),
                                                grandTotal: int.parse(
                                                    e.price?.split('.').first ??
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
                                      element.orderStatus == 'Tambahan Biaya')
                                  .isNotEmpty
                              ? SingleChildScrollView(
                                  child: Column(
                                      children: controller
                                          .clientOrderModel!.data!.data!
                                          .where((element) =>
                                              element.orderStatus ==
                                              'Tambahan Biaya')
                                          .map((e) => PesananCard(
                                                idPesanan:
                                                    int.parse(e.id ?? '0'),
                                                statusPesanan: e.orderStatus,
                                                namaPenjahit: e.namapenjahit,
                                                invoice: '${e.tglOrder}',
                                                // itemImg: '$categoryImg/${e.}',
                                                jumlahItem:
                                                    int.parse(e.quantity!),
                                                grandTotal: int.parse(
                                                    e.price?.split('.').first ??
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
                                      element.orderStatus == 'Diterima')
                                  .isNotEmpty
                              ? SingleChildScrollView(
                                  child: Column(
                                      children: controller
                                          .clientOrderModel!.data!.data!
                                          .where((element) =>
                                              element.orderStatus == 'Diterima')
                                          .map((e) => PesananCard(
                                                idPesanan:
                                                    int.parse(e.id ?? '0'),
                                                actionButton: () {
                                                  controller.updateOrder(
                                                      int.parse(e.id ?? '0'),
                                                      'Selesai');
                                                },
                                                statusPesanan: e.orderStatus,
                                                namaPenjahit: e.namapenjahit,
                                                invoice: '${e.tglOrder}',
                                                // itemImg: '$categoryImg/${e.}',
                                                jumlahItem: int.parse(
                                                    e.quantity ?? '0'),
                                                grandTotal: int.parse(
                                                    e.price?.split('.').first ??
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
                                      element.orderStatus == 'Selesai')
                                  .isNotEmpty
                              ? SingleChildScrollView(
                                  child: Column(
                                      children: controller
                                          .clientOrderModel!.data!.data!
                                          .where((element) =>
                                              element.orderStatus == 'Selesai')
                                          .map((e) => PesananCard(
                                                idPesanan:
                                                    int.parse(e.id ?? '0'),
                                                statusPesanan: e.orderStatus,
                                                namaPenjahit: e.namapenjahit,
                                                invoice: '${e.tglOrder}',
                                                jumlahItem:
                                                    int.parse(e.quantity!),
                                                grandTotal: int.parse(
                                                    e.price?.split('.').first ??
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
