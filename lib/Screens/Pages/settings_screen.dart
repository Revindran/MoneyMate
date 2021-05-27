import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:money_mate/Screens/Auth/signin_screen.dart';

class SettingsPage extends StatelessWidget {
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Hero(
                tag: 'tag',
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/user_pic.png')))),
              ),
              ElevatedButton(
                child: Text('Log Out'),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  storage.remove('email');
                  Get.offAll(() => SignInPage());
                },
              ),
            ],
          ),
        ));
  }
}
