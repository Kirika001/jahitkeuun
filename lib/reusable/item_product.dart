import 'package:flutter/material.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/textstyle.dart';

class ItemProduct extends StatelessWidget {
  final String? namaItem;
  final String? namaJasa;
  final int? qty;
  final int? subTotal;

  const ItemProduct({
    Key? key,
    this.namaItem = 'Blouse',
    this.namaJasa = 'Jahit Exclude Bahan',
    this.qty = 1,
    this.subTotal = 300000,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(blouseImg),
      title: Text(
        namaItem!,
        style: labelTextStyle,
      ),
      subtitle: Text(
        namaJasa!,
        style: mainTextStyle,
      ),
      trailing: RichText(
          textAlign: TextAlign.right,
          text: TextSpan(children: [
            TextSpan(
                text: 'x ${qty}',
                style: mainTextStyle.copyWith(color: darkColor)),
            TextSpan(
                text: '\nRp.${subTotal},-',
                style: labelTextStyle.copyWith(color: darkColor))
          ])),
    );
  }
}
