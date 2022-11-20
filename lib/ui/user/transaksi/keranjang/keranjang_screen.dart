import 'package:flutter/material.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/customfilledbutton.dart';

class KeranjangScreen extends StatelessWidget {
  const KeranjangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: darkColor,
        ),
        titleTextStyle: titleTextStyle.copyWith(color: darkColor),
        title: Text('Keranjang'),
      ),
      body: ListView(
        children: [],
      ),
      bottomNavigationBar: Container(
        height: 155,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            color: mainColor),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total", style: labelTextStyle),
              Text("Rp. Grand Total ,-", style: titleTextStyle),
              CustomFilledButton(title: 'Lanjut Bayar', color: darkColor)
            ],
          ),
        ),
      ),
    );
  }
}
