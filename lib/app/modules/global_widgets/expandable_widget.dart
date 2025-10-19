import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpandableWidget extends StatelessWidget {
  ExpandableWidget({Key? key, this.title, this.childData}) : super(key: key);

  String? title;
  var childData;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.bottomLeft,
        title: Text(
          title!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        children: List.generate(childData!.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${childData![index].attributeName!}:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Get.theme.textTheme.bodyMedium!.color,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  childData![index].attributeValue!,
                  style: TextStyle(
                    fontSize: 12,
                    color: Get.theme.textTheme.bodyMedium!.color,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
