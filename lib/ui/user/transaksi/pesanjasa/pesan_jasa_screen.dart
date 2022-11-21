import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/customfilledbutton.dart';
import 'package:jahitkeeun/ui/user/transaksi/pesanjasa/pesan_jasa_controller.dart';

class PesanJasaScreen extends StatelessWidget {
  const PesanJasaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PesanJasaController>(
        init: PesanJasaController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: lightColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: darkColor),
              titleTextStyle: titleTextStyle.copyWith(color: darkColor),
              title: Text('Pesan Jasa'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Text('\nMemesan Dari', style: subtitleTextStyle),
                  Text(controller.name, style: titleTextStyle),
                  Text('\nItem', style: labelTextStyle),
                  DropdownButtonFormField2(
                    decoration: const InputDecoration(
                        fillColor: Colors.transparent,
                        filled: false,
                        border: InputBorder.none),
                    dropdownPadding: EdgeInsets.zero,
                    isExpanded: true,
                    // value: controller.itemID != 0 ? controller.selectedItem = controller.itemID.toString() : controller.selectedItem,
                    value: controller.selectedItem =
                        controller.itemID.toString(),
                    hint: Text('Pilih Item'),
                    items: controller.listCategoryItem
                        .map((item) => DropdownMenuItem<String>(
                      value: item.itemId,
                      child: Text(item.itemName.toString() ?? ''),
                    ))
                        .toList() ??
                        [],
                    // items: [],
                    validator: (value) {
                      if (value == "Pilih Item") {
                        return "Silahkan pilih item";
                      }
                      return null;
                    },
                    // onSaved: (value) {
                    //   value.toString();
                    // },
                    onChanged: (value) {
                      controller.selectedJasa = null;
                      controller.selectedItem = value.toString();
                      controller.listService(
                          int.parse(controller.selectedItem.toString()));
                      controller.update();
                      // controller.selectedItem.value = value.toString();
                    },
                  ),
                  Text('\nJasa', style: labelTextStyle),
                  // controller.serviceTailorModel!.data!.data! != null ?
                  // Text('\n${controller.serviceTailorModel!.data!.data!.first.serviceName ??''}')
                  // : Text('pilih item dulu'),
                  // controller.serviceTailorModel!.data!.data! != null ?
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: false,
                      border: InputBorder.none,
                    ),
                    dropdownPadding: EdgeInsets.zero,
                    isExpanded: true,
                    value: controller.selectedJasa,
                    hint: Text('Pilih Jasa'),
                    items: controller.listServiceItem
                        .map((item) => DropdownMenuItem(
                      value: item.serviceId,
                      child:
                      Text(item.serviceName.toString() ?? ''),
                      onTap: () {
                        if (controller.listServiceItem.isNotEmpty) {
                          print("harga ${item.servicePrice}");
                          controller.harga = item.servicePrice!;
                          // controller.harga = int.tryParse(item.servicePrice?.toString() ?? "0") ?? 0;
                          // controller.selectedJasa.value = item.serviceId;
                          controller.update();
                        }
                      },
                    ))
                        .toList() ??
                        [],
                    // items: [],
                    validator: (value) {
                      if (value == "Pilih Jasa") {
                        return "Silahkan pilih Jasa";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      value.toString();
                    },
                    onChanged: (value) {
                      controller.selectedJasa = value.toString();
                      controller.serviceID = int.parse(value.toString());
                      controller.update();
                      print('serviceID : $value');
                    },
                  ),
                  Text('\nDeskripsi Pesanan', style: labelTextStyle),
                  TextField(
                    controller: controller.descController,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText:
                        'Deskripsikan kebutuhan anda dengan detil dan jelas',
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
                  ),
                  Text('\nGambar Rancangan atau Referensi',
                      style: labelTextStyle),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: secondaryColor.withOpacity(0.1)),
                    child: Column(
                      children: [
                        Center(
                          child: controller.gettedPhoto != null
                              ? Container(
                            height: 150,
                            width: 150,
                            child: Image.file(
                              controller.gettedPhoto!,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                              : Container(),
                        ),
                        CustomFilledButton(
                            color: infoColor,
                            title: 'Pilih Foto',
                            icon: Icons.camera_alt,
                            onPressed: () => controller.getSinglePhoto()),
                      ],
                    ),
                  ),
                  Text('\nPilih Tanggal Pickup', style: labelTextStyle),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: secondaryColor.withOpacity(0.1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        controller.selectedDate != null
                            ? Text(DateFormat('yyyy-MM-dd')
                            .format(controller.selectedDate!)
                            .toString())
                            : Text('Pilih tanggal'),
                        IconButton(
                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 30)))
                                .then((date) {
                              controller.selectedDate = date!;
                              controller.update();
                            });
                          },
                          icon: Icon(Icons.calendar_month),
                        ),
                      ],
                    ),
                  ),
                  Text('\nJumlah Item', style: labelTextStyle),
                  Container(
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.decQty();
                              controller.update();
                            },
                            icon: Icon(Icons.remove)),
                        Text(controller.qty.toString()),
                        IconButton(
                            onPressed: () {
                              controller.incQty();
                              controller.update();
                            },
                            icon: Icon(Icons.add))
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  controller.isLoading == true
                      ? Center(child: CircularProgressIndicator.adaptive())
                      : Container(),
                ],
              ),
            ),
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
                    Text("Harga", style: labelTextStyle),
                    // Text(controller.formatter.format(controller.harga).split('.').first),
                    Text(
                      controller.formatter
                          .format(controller.harga.split('.').first),
                      style: titleTextStyle,
                    ),
                    // Text("${controller.numberFormat.format(controller.harga)} ,-",
                    //     style: titleTextStyle),
                    CustomFilledButton(
                        onPressed: () {
                          controller.addToCart();
                        },
                        title: 'Tambah ke Keranjang',
                        color: darkColor)
                  ],
                ),
              ),
            ),
          );
        });
  }
}
