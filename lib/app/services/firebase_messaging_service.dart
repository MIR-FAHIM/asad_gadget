import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';

class FireBaseMessagingService extends GetxService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    importance: Importance.high,
    playSound: true,
  );

  Future<FireBaseMessagingService> init() async {
    firebaseCloudMessagingListeners();

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@drawable/notification_icon');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        Get.toNamed(Routes.ROOT);
      },
    );

    return this;
  }

  void firebaseCloudMessagingListeners() {
    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message != null) {
        Get.toNamed(Routes.ROOT);
      }
    });

    FirebaseMessaging.instance
        .requestPermission(sound: true, badge: true, alert: true);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      if (notification != null) {
        flutterLocalNotificationsPlugin.show(
          message.data.hashCode,
          notification.title ?? '',
          notification.body ?? '',
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      Get.toNamed(Routes.ROOT);
    });
  }

  Future<String?> getDeviceToken() async {
    return await FirebaseMessaging.instance.getToken();
  }
}
