import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/Color.dart';

class DrawerLinkWidget extends StatelessWidget {
  final String? icon;
  final String? text;
  int? id = 0;
  final ValueChanged<void>? onTap;
   DrawerLinkWidget({
    Key? key,
    this.icon,
    this.text,
    this.id,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!('');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          children: [
           id == 1 ?
           Image(
             image: AssetImage(icon!),
             height: 25,
             width: 25,
             color: Colors.red,
           )
          : Image(
              image: AssetImage(icon!),
              height: 25,
              width: 25,
              color: Get.theme.primaryColor,
            ),
            icon != null
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    width: 1,
                    height: 28,
                    color: Get.theme.dividerColor.withOpacity(0.2),
                  )
                : Wrap(),
            Expanded(
              child: Text(text!.tr, style: Get.textTheme.bodyMedium!.merge(TextStyle(fontSize: 16, color:  id == 1 ? Colors.red : AppColors.primaryColor))),
            ),
          ],
        ),
      ),
    );
  }
}
