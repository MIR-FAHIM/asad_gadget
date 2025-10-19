import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:asad_gadget/common/ui.dart';

class SquareCardTextWidget extends StatelessWidget {
  SquareCardTextWidget(
      {Key? key,
      this.image,
      this.colors,
      this.name = 'title',
      this.title = 'title',
      this.width = 50,
      this.aspectRetio = 1.02,
      this.radius = 10.0,
      this.allpadding = 0.0})
      : super(key: key);
  final String? image, name, title;
  final double? width, aspectRetio;
  final double radius, allpadding;
  final colors;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: Container(
        decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 8),
            name != null
                ? Text(
                    name!,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                    textAlign: TextAlign.center,
                  )
                : Wrap(),
            SizedBox(height: 5),
            title != null
                ? Text(
                    title!,
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  )
                : Wrap(),
          ],
        ),
      ),
    );
  }
}
