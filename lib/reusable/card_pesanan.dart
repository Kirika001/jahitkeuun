import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/data/model/update_statusorder_model.dart';
import 'package:jahitkeeun/data/network_core.dart';
import 'package:jahitkeeun/data/repository/repository.dart';
import 'package:jahitkeeun/data/storage_core.dart';
import 'package:jahitkeeun/reusable/customdivider.dart';
import 'package:jahitkeeun/reusable/customfilledbutton.dart';
import 'package:jahitkeeun/reusable/item_product.dart';
import 'package:jahitkeeun/ui/user/pesanan/pesanan_controller.dart';

NumberFormat numberFormat =
    NumberFormat.currency(locale: "id", symbol: "Rp. ", decimalDigits: 0);

UpdateStatusorderModel? updateStatusorderModel;
NetworkCore networkCore = Get.find<NetworkCore>();
Repository repository = Get.find<Repository>();
StorageCore storage = StorageCore();

late String? buttonTitle;
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
  final VoidCallback? actionButton;

  const PesananCard({
    Key? key,
    this.onTap,
    this.namaPenjahit = "Nama Penjahit",
    this.invoice = "Tanggal / No.Invoice",
    this.statusPesanan = "Menunggu Pembayaran",
    this.statusColor = Colors.yellow,
    this.jumlahItem = 1,
    this.grandTotal = 300000,
    this.itemImg = blouseImg,
    this.namaItem = 'Kemeja',
    this.namaJasa,
    required this.idPesanan,
    this.actionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (statusPesanan) {
      case "Menunggu Pembayaran":
        {
          buttonColor = warningColor;
          buttonTitle = "Bayar Sekarang";
        }
        break;
      case "Menunggu Pickup":
        {
          buttonColor = infoColor;
          buttonTitle = "Bahan Dikirim";
        }
        break;
      case "Dalam Perjalanan":
        {
          buttonColor = warningColor;
          buttonTitle = "Paket Diterima";
        }
        break;
      case "Diterima":
        {
          buttonColor = warningColor;
          buttonTitle = "Selesaikan";
        }
        break;

      default:
        {
          buttonColor = Colors.transparent;
          buttonTitle = "";
        }
        break;
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
                    width: 150,
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
                      width: 110,
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
                            text:
                                '\n${numberFormat.format(grandTotal! * jumlahItem!.toInt())},-',
                            style: labelTextStyle.copyWith(color: darkColor))
                      ])),
                  CustomFilledButton(
                    borderColor: Colors.transparent,
                    color: buttonColor!,
                    title: buttonTitle ?? '',
                    height: 35,
                    width: 165,
                    onPressed: actionButton,
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
