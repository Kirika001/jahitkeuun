import 'package:flutter/material.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/reusable/customfilledbutton.dart';

class AlamatCard extends StatelessWidget {
  final String? namaAlamat;
  final String? namaPenerima;
  final String? nomorHp;
  final String? alamat;
  final bool? alamatUtama;

  const AlamatCard({
    Key? key,
    this.namaAlamat = 'nama alamat',
    this.namaPenerima = 'nama penerima',
    this.nomorHp = '0891234567',
    this.alamat = 'alamat lengkap',
    this.alamatUtama = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: secondaryColor)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(namaAlamat!),
            Text(namaPenerima!),
            Text(nomorHp!),
            Text(alamat!),
            alamatUtama == true
                ? CustomFilledButton(
                    color: mainColor,
                    title: 'Ubah Alamat',
                    height: 40,
                  )
                : Row(
                    children: [
                      Expanded(
                        child: CustomFilledButton(
                            color: mainColor, title: 'Ubah Alamat'),
                      ),
                      CustomFilledButton(
                        width: 63,
                        color: mainColor,
                        icon: Icons.more_vert,
                      )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
