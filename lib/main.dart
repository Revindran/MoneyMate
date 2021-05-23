import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:money_mate/Screens/Pages/analytics_screen.dart';
import 'package:money_mate/Screens/Pages/notes_screen.dart';
import 'package:money_mate/Screens/Pages/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/OnBoarding/onboarding_screen.dart';
import 'Screens/Pages/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.get('email');
  runApp(GetMaterialApp(
    title: 'On Boarding',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.amber),
    initialRoute: '/',
    routes: {
      '/home': (context) => HomePage(),
      '/analytics': (context) => AnalyticsPage(),
      '/notes': (context) => NotesPage(),
      '/settings': (context) => SettingsPage(),
    },
    home: email == null ? OnBoardingPage() : HomePage() /*MailLogin()*/,
  ));
}
