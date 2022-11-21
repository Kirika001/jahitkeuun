import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/customfilledbutton.dart';
import 'package:jahitkeeun/reusable/item_product.dart';
import 'package:jahitkeeun/ui/user/transaksi/keranjang/keranjang_controller.dart';

class KeranjangScreen extends StatelessWidget {
  const KeranjangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KeranjangController>(
        init: KeranjangController(),
        builder: (controller) {
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
            body: controller.userCartModel != null
                ? ListView.builder(
                itemCount: controller.listCarts.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.listCarts[index].namataylor!),
                          Divider(color: secondaryColor),
                          ItemProduct(
                            itemImage:
                            '$categoryImg/${controller.listCarts[index].photoItem}',
                            namaItem: controller.listCarts[index].item,
                            namaJasa:
                            controller.listCarts[index].serviceName,
                            qty: int.parse(
                                controller.listCarts[index].quantity!),
                            subTotal: int.parse(controller
                                .listCarts[index].price!
                                .split('.')
                                .first),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    controller.deleteCart(int.parse(
                                        controller
                                            .listCarts[index].serviceId!));
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: errorColor,
                                  )),
                              Container(
                                decoration: BoxDecoration(
                                    color: secondaryColor.withOpacity(0.1),
                                    borderRadius:
                                    BorderRadius.circular(30)),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          controller.decQty(
                                              int.parse(controller
                                                  .listCarts[index]
                                                  .serviceId!),
                                              int.parse(controller
                                                  .listCarts[index]
                                                  .quantity!));
                                          controller.update();
                                        },
                                        icon: Icon(Icons.remove)),
                                    // Text(controller.tempQty.toString()),
                                    Text(controller
                                        .listCarts[index].quantity
                                        .toString()),
                                    IconButton(
                                        onPressed: () {
                                          controller.incQty(
                                              int.parse(controller
                                                  .listCarts[index]
                                                  .serviceId!),
                                              int.parse(controller
                                                  .listCarts[index]
                                                  .quantity!));
                                          controller.update();
                                        },
                                        icon: Icon(Icons.add))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: '\nDeskripsi Pesanan : \n',
                                    style: labelTextStyle.copyWith(
                                        color: darkColor)),
                                TextSpan(
                                    text:
                                    controller.listCarts[index].description,
                                    style: subtitleTextStyle.copyWith(
                                        color: darkColor))
                              ]))
                        ],
                      ),
                    ),
                  );
                  // if (controller.listCarts.isNotEmpty){
                  // /
                  // }
                  // else {
                  //   return Text("Keranjang Kosong");
                  // }
                })
                : const Center(child: Text("Keranjangmu Kosong")),
            bottomNavigationBar: Container(
              height: 155,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: mainColor),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total", style: labelTextStyle),
                    Text(
                        "${controller.numberFormat.format(controller.grandTotal)} ,-",
                        style: titleTextStyle),
                    CustomFilledButton(title: 'Checkout', color: darkColor)
                  ],
                ),
              ),
            ),
          );
        });
  }
}
