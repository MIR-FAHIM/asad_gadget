import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckBoxWidget extends StatelessWidget {
  final title;

  CheckBoxWidget({this.title = ''});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 15,
          width: 15,
          color: Color(0xFF652981),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
          ),
        )
      ],
    ).paddingSymmetric(vertical: 5, horizontal: 20);
  }
}
