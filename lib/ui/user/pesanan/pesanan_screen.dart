import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/ui/user/pesanan/pesanan_controller.dart';

class PesananScreen extends StatefulWidget {
  const PesananScreen({Key? key}) : super(key: key);

  @override
  State<PesananScreen> createState() => _PesananScreenState();
}

class _PesananScreenState extends State<PesananScreen> with TickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 8, vsync: this);
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
                        onPressed: () {}, icon: Icon(Icons.shopping_cart))
                  ],
                ),
              ),
              ButtonsTabBar(
                controller: tabController,
                backgroundColor: mainColor,
                unselectedBackgroundColor: Colors.transparent,
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                borderWidth: 1,
                unselectedBorderColor: darkColor,
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
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    Text("SemuaPesanan()"),
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
