import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:asad_gadget/common/ui.dart';

class SquareCardWidget extends StatelessWidget {
  SquareCardWidget(
      {Key? key,
      this.image,
      this.colors,
      this.name = 'title',
      this.width = 50,
      this.aspectRetio = 1.02,
      this.radius = 10.0,
      this.allpadding = 0.0})
      : super(key: key);
  final String? image, name;
  final double? width, aspectRetio;
  final double radius, allpadding;
  final colors;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Container(
        decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 12),
            Container(
              height: width,
              width: width,
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(radius),
                child: Image(image: AssetImage(image!), color: colors),
              ),
            ),
            SizedBox(height: 12),
            name != null
                ? Expanded(
                    child: Text(
                      name!,
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Wrap(),
          ],
        ),
      ),
    );
  }
}
