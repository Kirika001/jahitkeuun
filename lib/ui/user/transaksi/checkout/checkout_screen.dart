import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/customdivider.dart';
import 'package:jahitkeeun/reusable/customfilledbutton.dart';
import 'package:jahitkeeun/ui/main/user_main_screen.dart';
import 'package:jahitkeeun/ui/user/transaksi/checkout/checkout_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
        init: CheckoutController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Checkout'),
            ),
            body: ListView(
              children: [
                ListTile(
                  title: Text('Invoice', style: titleTextStyle),
                  // subtitle: Text('Tanggal Transaksi'),
                  // trailing: Text('\n2022-11-12 11:00:00'),
                ),
                CustomDivider(
                  thickness: 5,
                ),
                // ListTile(
                //   leading: CircleAvatar(
                //     backgroundImage: NetworkImage(profilImg),
                //   ),
                //   title: Text('Nama Penjahit'),
                // ),
                // CustomDivider(),
                Column(
                  children: controller.items
                      .map(
                        (e) => ListTile(
                          leading: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(color: darkColor),
                              child:
                                  Image.network('$categoryImg/${e.photoItem}')),
                          title: Text(
                            e.item ?? '',
                            style: labelTextStyle,
                          ),
                          subtitle: Text(
                            e.serviceName ?? '',
                            style: mainTextStyle,
                          ),
                          trailing: RichText(
                              textAlign: TextAlign.right,
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'x ${e.quantity}',
                                    style: mainTextStyle.copyWith(
                                        color: darkColor)),
                                TextSpan(
                                    text: '\nRp.${e.price?.split('.').first},-',
                                    style: labelTextStyle.copyWith(
                                        color: darkColor))
                              ])),
                        ),
                      )
                      .toList(),
                ),

                CustomDivider(),
                ListTile(
                  title: Text('Total Pesanan'),
                  trailing: Text('Rp. ${Get.arguments['amount']}',
                      style: titleTextStyle),
                ),
                CustomDivider(),
                ListTile(
                    title: Text('Alamat Pengambilan', style: titleTextStyle)),
                ListTile(
                  title: Text('${Get.arguments['alamat']}'),
                ),
                CustomDivider(),
              ],
            ),
            bottomNavigationBar: Padding(
                child: CustomFilledButton(
                  color: darkColor,
                  title: 'Checkout',
                  onPressed: (){
                    Fluttertoast.showToast(
                        msg: 'Checkout Berhasil');
                    Get.offAll(UserMainScreen());
                  },
                ),
                padding: EdgeInsets.all(10)),
          );
        });
  }
}
