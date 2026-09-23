import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:asad_gadget/app/services/auth_service.dart';
import 'package:asad_gadget/app/services/firebase_messaging_service.dart';
import 'package:asad_gadget/app/services/location_service.dart';
import 'package:asad_gadget/app/services/settings_service.dart';
import 'package:asad_gadget/app/services/translation_service.dart';

import 'app/routes/app_pages.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

String type = '';

Future<void> backgroundHander(RemoteMessage message) async {
  if (message.data.isNotEmpty) {
    type = message.data['notification_type'] != '' &&
            message.data['notification_type'] != null
        ? message.data['notification_type'].toString()
        : message.data['notification_sub_type'].toString();
    print('backgroundHander:${message.data['notification_type']}');
  }
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

initServices() async {
  Get.log('starting services ...');
  await GetStorage.init();

  await Firebase.initializeApp();

  await Permission.notification.status.then((value) {
    if (value.isGranted) {
      print("notification granted");
    } else {
      Permission.notification.request();
    }
  });

  await Get.putAsync<SettingsService>(() async => SettingsService());
  await Get.putAsync<AuthService>(() async => AuthService());
  await Get.putAsync(() => TranslationService().init());

  await Get.putAsync<LocationService>(() async => LocationService());
  FirebaseMessaging.onBackgroundMessage(backgroundHander);
  await Get.putAsync(() => FireBaseMessagingService().init());

  Get.log('All services started...');
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 800),
      title: "Asad Gadget",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        primarySwatch: Colors.purple,
        primaryColor: const Color(0xFF652981),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Get.find<TranslationService>().supportedLocales(),
      translationsKeys: Get.find<TranslationService>().translations,
      locale: Get.find<SettingsService>().getLocale(),
      fallbackLocale: Get.find<TranslationService>().fallbackLocale,
    ),
  );
}
