import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/customdivider.dart';
import 'package:jahitkeeun/reusable/customfilledbutton.dart';
import 'package:jahitkeeun/reusable/item_product.dart';

NumberFormat numberFormat = NumberFormat.currency(
  locale: "id",
  symbol: "Rp. ",
  decimalDigits: 0
);

late  String? buttonTitle;
late VoidCallback? action;
late Color? buttonColor;

class PesananCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String? namaPenjahit;
  final String? invoice;
  final String? statusPesanan;
  final Color? statusColor;
  final int? jumlahItem;
  final int? grandTotal;
  final String? itemImg;
  final String? namaItem;
  final String? namaJasa;
  final int idPesanan;

  const PesananCard({
    Key? key,
    this.onTap,
    this.namaPenjahit = "Nama Penjahit",
    this.invoice = "Tanggal / No.Invoice",
    this.statusPesanan = "Menunggu Pembayaran",
    this.statusColor = Colors.yellow,
    this.jumlahItem = 1,
    this.grandTotal = 300000,
    this.itemImg = 'https://i.pinimg.com/564x/7b/bd/53/7bbd538f37332c17f174f94c20cab7b3.jpg',
    this.namaItem = 'Kemeja',
    this.namaJasa,
    required this.idPesanan,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    switch(statusPesanan){
      case "BELUM BAYAR" : {
        buttonColor = errorColor;
        buttonTitle = "Bayar Sekarang";
        action = (){
          print('bayar sekarang');
        };
      }
      break;
      case "LUNAS" : {
        buttonColor = Colors.transparent;
        buttonTitle = "";
        action = (){
          print('udah lunas');
        };
      }
    }


    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        shadowColor: secondaryColor,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: secondaryColor),
            borderRadius: BorderRadius.circular(5)),
        elevation: 3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: namaPenjahit,
                          style: labelTextStyle.copyWith(color: darkColor)),
                      TextSpan(
                          text: '\n$invoice',
                          style: mainTextStyle.copyWith(color: darkColor))
                    ])),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                          color: statusColor,
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(statusPesanan!))
                ],
              ),
            ),
            CustomDivider(
              color: secondaryColor.withOpacity(0.2),
              indent: 5,
              endIndent: 5,
            ),
            ItemProduct(
              qty: jumlahItem,
              itemImage: itemImg,
              namaItem: namaItem,
              namaJasa: namaJasa,
              subTotal: grandTotal,
            ),
            CustomDivider(
              color: secondaryColor.withOpacity(0.2),
              indent: 5,
              endIndent: 5,
            ),
            // jumlahItem !=1 ?
            // Column(
            //   children: [
            //     Padding(
            //         padding: const EdgeInsets.only(bottom: 10.0),
            //         child: Text('Tampilkan Item Lagi')),
            //     CustomDivider(
            //       color: secondaryColor.withOpacity(0.2),
            //       indent: 5,
            //       endIndent: 5,
            //     ),
            //   ],
            // ) : Container(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Total Pembayaran:',
                            style: mainTextStyle.copyWith(color: darkColor)),
                        TextSpan(
                            text: '\n${numberFormat.format(grandTotal! * jumlahItem!.toInt())},-',
                            style: labelTextStyle.copyWith(color: mainColor))
                      ])),
                  CustomFilledButton(
                    borderColor: Colors.transparent,
                    color: buttonColor!,
                    title: buttonTitle ?? '',
                    height: 35,
                    width: 165,
                    onPressed: action,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
