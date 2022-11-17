import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/card_pesanan.dart';
import 'package:jahitkeeun/reusable/customdivider.dart';
import 'package:jahitkeeun/ui/user/pesanan/pesanan_controller.dart';
import 'package:jahitkeeun/ui/user/pesanan/semua/semua_pesanan_screen.dart';

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
          return Column(
            children: [
              SafeArea(child: Container()),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: Get.width - 70,
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
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.shopping_cart))
                  ],
                ),
              ),
              TabBar(
                controller: tabController,
                labelStyle: mainTextStyle.copyWith(fontWeight: FontWeight.bold,),
                labelColor: whiteColor,
                isScrollable: true,
                indicatorColor: mainColor,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                    color: mainColor
                ),
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
                    text: "Pembayaran Terkonfirmasi",
                  ),
                  Tab(
                    text: "Menunggu Pickup",
                  ),
                  Tab(
                    text: "Dalam Pengiriman",
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
                    text: "Selesai",
                  ),
                  Tab(
                    text: "Diterima",
                  ),
                ],
              ),
              CustomDivider(color: mainColor,),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    SemuaPesananScreen(),
                    Text("PembayaranTerkonfirmasi()"),
                    Text("MenungguPickup()"),
                    Text("PesananDalamPengiriman()"),
                    Text("ProsesJahit()"),
                    Text("DalamPengantaran()"),
                    Text("TambahanBiaya()"),
                    Text("PesananSelesai()"),
                    Text("PesananDiterima()"),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
