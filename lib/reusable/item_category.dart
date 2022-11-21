import 'package:flutter/material.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/temp_img.dart';

class ItemCategory extends StatelessWidget {
  final String? namaCategory;
  final String? imgCategory;
  final VoidCallback? onTap;

  const ItemCategory({
    Key? key,
    this.namaCategory = 'Blouse',
    this.imgCategory = blouseImg,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: EdgeInsets.all(8),
        color: darkColor,
        child: Image.network(
          imgCategory!,
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
            return Container();
          },
        ),
      ),
      title: Text(namaCategory!),
      trailing: Icon(Icons.chevron_right),
    );
  }
}
