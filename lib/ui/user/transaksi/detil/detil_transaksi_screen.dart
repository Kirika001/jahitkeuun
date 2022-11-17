import 'package:flutter/material.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/customdivider.dart';

class DetilTransaksiScreen extends StatelessWidget {
  const DetilTransaksiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detil Transaksi'),
      ),
      body: ListView(
        children: [
          ListTile(
              title: Text('Status',
                  style: titleTextStyle.copyWith(color: errorColor))),
          CustomDivider(),
          ListTile(
            title: Text('Nomor Invoice'),
            subtitle: Text('Tanggal Transaksi'),
            trailing: Text('\n2022-11-12 11:00:00'),
          ),
          CustomDivider(
            thickness: 5,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(profilImg),
            ),
            title: Text('Nama Penjahit'),
          ),
          CustomDivider(),
          ListTile(
            leading: Image.network(blouseImg),
            title: Text(
              'namaItem!',
              style: labelTextStyle,
            ),
            subtitle: Text(
              'namaJasa!',
              style: mainTextStyle,
            ),
            trailing: RichText(
                textAlign: TextAlign.right,
                text: TextSpan(children: [
                  TextSpan(
                      text: 'x 1',
                      style: mainTextStyle.copyWith(color: darkColor)),
                  TextSpan(
                      text: '\nRp.subTotal,-',
                      style: labelTextStyle.copyWith(color: darkColor))
                ])),
          ),
          CustomDivider(),
          ListTile(
            title: Text('Total Pesanan'),
            trailing: Text('Rp. Grand total', style: titleTextStyle),
          ),
          CustomDivider(),
          ListTile(title: Text('Rincian Pengiriman', style: titleTextStyle)),
          ListTile(
            title: Text('Biaya Pengiriman'
                '\nBiaya Penjemputan'),
            trailing: Text('Rp. Biaya Pengiriman'
                '\nRp. Biaya Penjemputan'),
          ),
          CustomDivider(),
          ListTile(
              title: Text(
            'Rincian Pembayaran',
            style: titleTextStyle,
          )),
          ListTile(
            title: Text("Metode Pembayaran"),
          )
        ],
      ),
    );
  }
}
