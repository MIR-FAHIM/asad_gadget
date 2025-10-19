import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlockButtonWidget extends StatelessWidget {
  BlockButtonWidget(
      {Key? key,
      this.color,
      this.text,
      this.onPressed,
      this.radius = 10,
      this.width})
      : super(key: key);

  final Color? color;
  final Widget? text;
  final double radius;
  final VoidCallback? onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.size.width,
      decoration: this.onPressed != null
          ? BoxDecoration(

              // borderRadius: BorderRadius.all(Radius.circular(20)),
              )
          : null,
      child: MaterialButton(
        onPressed: this.onPressed,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: this.color,
        disabledElevation: 0,
        disabledColor: Get.theme.focusColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        child: this.text,
        elevation: 0,
      ),
    );
  }
}
