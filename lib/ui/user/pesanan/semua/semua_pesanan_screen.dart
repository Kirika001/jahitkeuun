import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/reusable/card_pesanan.dart';

class SemuaPesananScreen extends StatelessWidget {
  const SemuaPesananScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PesananCard(onTap: ()=> Get.toNamed('detilTransaksi'),),
          PesananCard(),
        ],
      ),
    );
  }
}
