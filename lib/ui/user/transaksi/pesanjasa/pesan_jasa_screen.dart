import 'package:flutter/material.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/customfilledbutton.dart';

class PesanJasaScreen extends StatelessWidget {
  const PesanJasaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan Jasa'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: [
            Text('\nMemesan Dari', style: subtitleTextStyle),
            Text('Nanami Tailor', style: titleTextStyle),
            Text('\nItem', style: labelTextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pilih Item',
                  style: subtitleTextStyle,
                ),
                Icon(Icons.arrow_drop_down)
              ],
            ),
            Text('\nDeskripsi Pesanan', style: labelTextStyle),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                  hintText:
                  'Deskripsikan kebutuhan anda dengan detil dan jelas',
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
            ),
            Text('\nGambar Rancangan atau Referensi', style: labelTextStyle),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: secondaryColor.withOpacity(0.1)
              ),
              child: CustomFilledButton(
                color: infoColor,
                title: 'Pilih Foto',
                icon: Icons.camera_alt,
              ),
            ),
            Text('\nPilih Tanggal Pickup', style: labelTextStyle),
            //date picker
          ],
        ),
      ),
    );
  }
}
