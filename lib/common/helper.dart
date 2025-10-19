import 'dart:convert' as convert;
import 'dart:io' as io;

import 'package:flutter/services.dart';
import 'package:asad_gadget/app/models/operator_model.dart';

class Helper {
  static Future<dynamic> getJsonFile(String path) async {
    return rootBundle.loadString(path).then(convert.jsonDecode);
  }

  String operatorCheck(String number) {
    number = number.replaceAll('+88', '');
    late String logo;
    for (var item in operators) {
      //print(item.name);
      if (number.length > 3) {
        if (number.substring(0, 3) == item.name) {
          logo = item.logo!;
        }
      }
    }
    return logo;
  }

  String mfsCheck(String number) {
    number = number.replaceAll('+88', '');
    late String logo;
    for (var item in operators) {
      print(item.name);
      if (number.length > 3) {
        if (number.substring(0, 3) == item.name) {
          logo = item.logo!;
        }
      }
    }
    return logo;
  }
}
