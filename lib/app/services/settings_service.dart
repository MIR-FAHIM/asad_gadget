import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'translation_service.dart';

class SettingsService extends GetxService {
  late GetStorage _box;
  StreamSubscription<String?>? _sub;
  SettingsService() {
    _box = GetStorage();

  }

  ThemeData getLightTheme() {
    // TODO change font dynamically
    return ThemeData(
        primaryColor: const Color(0xFF652981),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(elevation: 0, foregroundColor: Color(0xFF652981)),
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,

        dividerColor: Colors.grey.shade800,
        focusColor: const Color(0xFF652981),
        hintColor: Colors.grey,
        splashColor: Colors.grey.shade200,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: const Color(0xFF652981)),
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        colorScheme: const ColorScheme.light(primary: Color(0xFF652981), secondary: Color(0xFF652981)),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: Color(0xFF652981), height: 1.3),
          headlineSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.black, height: 1.3),
          headlineMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Colors.black, height: 1.3),
          displaySmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.black, height: 1.3),
          displayMedium: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: Color(0xFF652981), height: 1.4),

          titleSmall: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: Colors.black, height: 1.2),
          titleMedium: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: Color(0xFF652981), height: 1.2),
          bodyMedium: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600, color: Colors.black, height: 1.2),
          bodyLarge: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.black, height: 1.2),
          bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300, color: Color(0xFF652981), height: 1.2),
        ));
  }

  ThemeMode getThemeMode() {
    String? _themeMode = GetStorage().read<String>('theme_mode');
    switch (_themeMode) {
      case 'ThemeMode.light':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.white),
        );
        return ThemeMode.light;
      case 'ThemeMode.dark':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: Colors.black87),
        );
        return ThemeMode.dark;
      default:
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.white),
        );
        return ThemeMode.light;
    }
  }
  void handleDeepLink(String url) {
    print("Received deep link: $url");
    // Navigate to the specific page or perform any action based on the link
  }


  Locale getLocale() {
    String? _locale = GetStorage().read<String>('language');
    print(_locale);
    if (_locale == null || _locale.isEmpty) {
      _locale = 'bn_BD';
    }
    return Get.find<TranslationService>().fromStringToLocale(_locale);
  }
}
