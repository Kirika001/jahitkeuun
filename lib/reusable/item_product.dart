import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/textstyle.dart';

NumberFormat numberFormat =
NumberFormat.currency(locale: "id", symbol: "Rp. ", decimalDigits: 0);

class ItemProduct extends StatelessWidget {
  final String? namaItem;
  final String? namaJasa;
  final int? qty;
  final int? subTotal;
  final String? itemImage;


  const ItemProduct({
    Key? key,
    this.namaItem = 'Blouse',
    this.namaJasa = 'Jahit Exclude Bahan',
    this.qty = 1,
    this.subTotal = 300000,
    this.itemImage = blouseImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50, height: 50,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: darkColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.network(
          itemImage!,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
                  : null,
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Image.network(
              blouseImg, fit: BoxFit.cover,);
          },
        ),
      ),
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
                text: '\n${numberFormat.format((subTotal!))},-',
                style: labelTextStyle.copyWith(color: darkColor))
          ])),
    );
  }
}
