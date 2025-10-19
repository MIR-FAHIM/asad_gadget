import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'package:asad_gadget/app/modules/asadgadgets/login/controllers/login_controller.dart';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/app/services/notificationlocal.dart';
import 'package:asad_gadget/main.dart';


class FireBaseMessagingService extends GetxService {
  late List<String?> numbers;
  final FlutterTts _flutterTts = FlutterTts();
  Future<FireBaseMessagingService> init() async {
    firebaseCloudMessagingListeners();
    // await flutterLocalNotificationsPlugin
    //     .resolvePlatformSpecificImplementation<
    //         AndroidFlutterLocalNotificationsPlugin>()
    //     ?.createNotificationChannel(channel);

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@drawable/notification_icon');
    var initialzationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initialzationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        // Handle the notification tap here
        print('Notification tapped: ${response.payload}');
      },);

    return this;
  }

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      // 'This channel is used for important notifications.', // description
      importance: Importance.high,
      playSound: true);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void firebaseCloudMessagingListeners() {
    ///gives you the message on which user taps
    ///and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message != null) {
        RemoteNotification notification = message.notification!;
        type = message.data['notification_type'] != '' &&
                message.data['notification_type'] != null
            ? message.data['notification_type'].toString()
            : message.data['notification_sub_type'].toString();
        print(
            'i am in get initial message function:${message.data['notification_type']}');

        // flutterLocalNotificationsPlugin.show(
        //     message.data.hashCode,
        //     notification.title!,
        //     notification.body!,
        //     NotificationDetails(
        //       android: AndroidNotificationDetails(
        //         channel.id,
        //         channel.name,
        //         // channel.description,
        //         // TODO add a proper drawable resource to android, for now using
        //         //      one that already exists in example app.
        //         // icon: message.notification!.android!.smallIcon,
        //       ),
        //     ));
        // if (type == '') {
        //   if (message.data.isNotEmpty) {
        //     if (message.data['notification_type'].toString() == '1') {
        //       Get.toNamed(Routes.OFFER, arguments: message.data['notification_type'].toString());
        //     }
        //     if (message.data['notification_type'].toString() == '2') {
        //       Get.toNamed(Routes.RECHARGE_REPORT, arguments: message.data['notification_type'].toString());
        //     }
        //     if (message.data['notification_type'].toString() == '3') {
        //       Get.toNamed(Routes.TRANSACTION_HISTORY, arguments: message.data['notification_type'].toString());
        //     }
        //   }
        // }
      }
    });

    FirebaseMessaging.instance
        .requestPermission(sound: true, badge: true, alert: true);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification notification = message.notification!;
      print(notification.title!);
      print("I am here");
    //  _speak(notification.body!);
      print('I am in on message function:${message.data['notification_type']}');
      //new added
      // NotificationLocal.showBigTextNotification(title: notification.title!, body: "hlw",
      //     fln: flutterLocalNotificationsPlugin, payload:"3" );
      // new end

      // snackbar

      flutterLocalNotificationsPlugin.show(
        message.data.hashCode,
        notification.title!,
        notification.body!,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            // channel.description,
            // TODO add a proper drawable resource to android, for now using
            //      one that already exists in example app.
            // icon: message.notification!.android!.smallIcon,
          ),
        ),
        payload: notification.title!.contains("Robi Recharge")
            ? notification.body!
            : notification.title!.contains("Airtel Recharge")
                ? notification.body!
                : notification.title!.contains("Teletalk Recharge")
                    ? notification.body!
                    : message.data['notification_type'].toString(),
      );


      //In App Notification
      // Get.showSnackbar(Ui.notificationSnackBar(
      //   title: notification.title!,
      //   message: notification.body!,
      // ));

      // if (message.data.isNotEmpty) {
      //   print('FireBaseMessagingService.firebaseCloudMessagingListeners: ${message.data['notification_type'].runtimeType}');
      //   if (message.data['notification_type'].toString() == '1') {
      //     Get.put(RootController()).changePageOutRoot(1);
      //     Get.toNamed(Routes.Notification_View, arguments: message.data['notification_type'].toString());
      //   }
      //   if (message.data['notification_type'].toString() == '2') {
      //     Get.toNamed(Routes.RECHARGE_REPORT, arguments: message.data['notification_type'].toString());
      //   }
      //   if (message.data['notification_type'].toString() == '3') {
      //     Get.toNamed(Routes.COLLECTION, arguments: message.data['notification_type'].toString());
      //   }
      // }
    });
    print("starting on message opened app function ++++++++++++++++++++++ ");
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print("i am in on message opened app function ");

      RemoteNotification notification = message.notification!;
      String? payloadOfOpenedApp =
          message.data['notification_type']?.toString() ?? '';

      // Get.showSnackbar(Ui.notificationSnackBar(
      //   title: notification.title!,
      //   message: notification.body!,
      // ));
      print(
          'on message opened app ${payloadOfOpenedApp} : ${message.notification!.title!}');
      print("on message opened app 7777777 ");
      // flutterLocalNotificationsPlugin.show(
      //     message.data.hashCode,
      //     notification.title!,
      //     notification.body!,
      //     NotificationDetails(
      //       android: AndroidNotificationDetails(
      //         channel.id,
      //         channel.name,
      //         // channel.description,
      //         // TODO add a proper drawable resource to android, for now using
      //         //      one that already exists in example app.
      //         // icon: message.notification!.android!.smallIcon,
      //       ),
      //     ));

      Map data = {"msg": "hlw"};
      if (message.data.isNotEmpty) {

        print(
            "bro my push notification type is ${message.data['notification_type'].toString()}");
        print(
            'FireBaseMessagingService.firebaseCloudMessagingListeners my notification type is ++++++++ ${message.data['notification_type'].toString()} is bro ${message.messageType} +++++++++: ${message.data['notification_type'].runtimeType}');



        if (message.data['notification_type'] == null) {
          Get.toNamed(Routes.RECHARGEPINNOTIFICATION,
              arguments: [notification.body, "mir"]);
        }
        if (message.data['notification_type'].toString() == '3') {
          print("hlw noti 22222 ");
          Get.toNamed(Routes.COLLECTION,
              arguments: message.data['notification_type'].toString());
        }
        if (message.data['notification_type'].toString() == '4') {
          print("hlw noti 22222 ");
          Get.toNamed(Routes.COLLECTION,
              arguments: message.data['notification_type'].toString());
        }
        if (notification.title!
            .contains("Robi Recharge Request from PayPlus")) {
          // Get.find<RechargeController>().rechargeNumber.value =  numbers[1]!;
          // Get.find<RechargeController>().amount.value =  numbers[0]!;
          // Get.find<RechargeController>().commission.value =  numbers[2]!;
          print("image notification 111111++++++++++++++");
          Get.toNamed(Routes.RECHARGEPINNOTIFICATION,
              arguments: [notification.body, "mir"]);
        }
      } else {
        print("on message opened app is not empty 44444444 ");
        if (notification.title!.contains("Payment Notification")) {
          Get.toNamed(Routes.COLLECTION,
              arguments: message.data['notification_type'].toString());
        } else if (notification.title!
            .contains("Robi Recharge Request from PayPos")) {


        } else if (notification.title!
            .contains("Airtel Recharge Request from PayPos")) {


        } else if (notification.title!
            .contains("Teletalk Recharge Request from PayPos")) {
          print("i am here +++++");


        } else {

          print("i am here in else on message opened app");
          if (notification.title!
              .contains("Teletalk Recharge Request from PayPos")) {
            print(
                "i am here in elseon message opened app  ${notification.body}");

            Get.toNamed(Routes.RECHARGEPINNOTIFICATION,
                arguments: [notification.body, "push"]);
          }
          print("image notification ${notification.title}++++++++++++++");
          // Get.toNamed(Routes.RECHARGEPINNOTIFICATION,
          //     arguments: [notification.body, "push"]);

          print("am i here on message opened app?????");
        }
      }
    });
  }

  Future<void> setDeviceToken() async {
    Get.find<LoginController>().deviceToken.value =
        (await FirebaseMessaging.instance.getToken())!;
  }

  Future<bool> extractNumbersFromString(String input) async {
    RegExp regExp = RegExp(r'\d+');
    numbers = regExp.allMatches(input).map((match) => match.group(0)).toList();
    return true;
  }

  void onSelectNotification(String? payload) async {
    print("I am in onselect notification function $payload");

    if (payload!.contains("Request amount")) {
      print(
          "i am here in else Request amount onSelectNotification ++++++++++ ${payload!}");

    }
    if (payload == "3") {
      Get.toNamed(Routes.COLLECTION);
    }
    if (payload == "2") {
      Get.toNamed(
        Routes.NUMBER_CHECK,
      );
    }
    // else {
    //   print("my payload else onSelectNotification$payload");
    //   Get.toNamed(
    //     Routes.Notification_View,
    //   );
    //   print("onSelectNotification am i here in last?????");
    // }

    // Map notificationModelMap = jsonDecode(payload!);
  }


  Future<void> _speak(String text) async {
    print("i am talking to you >>>>>>>>>");
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.speak(text);
  }
}
