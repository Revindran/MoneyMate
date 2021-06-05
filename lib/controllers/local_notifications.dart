import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:money_mate/controllers/user_controller.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

int totalIncome = 0, totalExpanse = 0;
var controller = UserController();

class LocalNotificationsController extends GetxController {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  var storage = GetStorage();
  var email;

  @override
  void onInit() async {
    email = storage.read('email');
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(email)
        .collection('Transactions')
        .get()
        .then((value) async {
      for (int i = 0; i < value.docs.length; i++) {
        QueryDocumentSnapshot snapshot = value.docs[i];
        if (snapshot['Type'] == 'Income')
          totalIncome += int.parse(snapshot['Amount']);
        else if (snapshot['Type'] == 'Expanse')
          totalExpanse += int.parse(snapshot['Amount']);
      }
    });
    super.onInit();
  } //Initialize

  Future initialize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("ic_launcher");

    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: iosInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }


  Future<void> configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  //Instant Notifications
  Future instantNofitication() async {
    var android = AndroidNotificationDetails("id", "channel", "description",
        importance: Importance.max, priority: Priority.high, ticker: 'ticker');

    var ios = IOSNotificationDetails();

    var platform = new NotificationDetails(android: android, iOS: ios);

    await _flutterLocalNotificationsPlugin.show(
        0, "Demo instant notification", "Tap to do something", platform,
        payload: "Welcome to demo app");
  }

  //Image notification
  Future imageNotification() async {
    var bigPicture = BigPictureStyleInformation(
        DrawableResourceAndroidBitmap("notify_icon"),
        largeIcon: DrawableResourceAndroidBitmap("notify_icon"),
        contentTitle: "Demo image notification",
        summaryText: "This is some text",
        htmlFormatContent: true,
        htmlFormatContentTitle: true);

    var android = AndroidNotificationDetails("id", "channel", "description",
        styleInformation: bigPicture);

    var platform = new NotificationDetails(android: android);

    await _flutterLocalNotificationsPlugin.show(
        0, "Demo Image notification", "Tap to do something", platform,
        payload: "Welcome to demo app");
  }

  //Stylish Notification
  Future stylishNotification(
      RxInt totalIncome, RxInt totalExpanse, RxInt totalBalance) async {
    var android = AndroidNotificationDetails("id", "channel", "description",
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        color: Colors.deepOrange,
        enableLights: true,
        enableVibration: true,
        playSound: true,
        largeIcon: DrawableResourceAndroidBitmap("ic_launcher"),
        styleInformation: MediaStyleInformation(
            htmlFormatContent: true, htmlFormatTitle: true));

    var platform = new NotificationDetails(android: android);

    await _flutterLocalNotificationsPlugin.show(
        0,
        "Available Balance ${totalIncome.value - totalExpanse.value}",
        "Total spend $totalExpanse",
        platform);
  }

  //Scheduled Notification
  Future scheduledNotification() async {
    var interval = RepeatInterval.everyMinute;
    var time = new Time(14, 50, 0);
    var bigPicture = BigPictureStyleInformation(
        DrawableResourceAndroidBitmap("ic_launcher"),
        largeIcon: DrawableResourceAndroidBitmap("ic_launcher"),
        contentTitle: "Demo image notification",
        summaryText: "This is some text",
        htmlFormatContent: true,
        htmlFormatContentTitle: true);

    var android = AndroidNotificationDetails("id", "channel", "description",
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        styleInformation: bigPicture);

    var platform = new NotificationDetails(android: android);

    await _flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        "Demo Scheduled notification",
        "Tap to do something",
        interval,
        platform);
  }

  //Cancel notification

  Future cancelNotification() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

// notification for daily at time
  Future scheduleDailyTenAMNotification() {
    return _flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'I hope you had an Amazing day!!',
        'Have you done Any Transactions Today?. Note it now!',
        nextInstanceOfTenAM(),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'daily notification channel id',
            'daily notification channel name',
            'daily notification description',
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  tz.TZDateTime nextInstanceOfTenAM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 15, 30);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
}
