import 'package:flutter/material.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/customfilledbutton.dart';

class TambahAlamatScreen extends StatelessWidget {
  const TambahAlamatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        title: Text('Tambah Alamat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Text(
              '\nNegara',
              style: labelTextStyle,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Negara'),
            ),
            Text(
              '\nProvinsi',
              style: labelTextStyle,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Provinsi'),
            ),
            Text(
              '\nKota/Kabupaten',
              style: labelTextStyle,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Kota/Kabupaten'),
            ),
            Text(
              '\nKecamatan',
              style: labelTextStyle,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Kecamatan'),
            ),
            Text(
              '\nDesa',
              style: labelTextStyle,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Desa'),
            ),
            Text('\nAlamat', style: labelTextStyle),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(hintText: '\nAlamat'),
            ),
            Text(
              '\nKode Pos',
              style: labelTextStyle,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Kode Pos'),
            ),
            CustomFilledButton(
              color: darkColor,
              title: 'Submit',
            )
          ],
        ),
      ),
    );
  }
}
