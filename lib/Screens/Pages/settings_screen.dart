import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/Screens/Auth/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

SharedPreferences prefs;

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    asyncMethod();
    super.initState();
  }

  void asyncMethod() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        // ignore: deprecated_member_use
        child: FlatButton(
          child: Text(
            'Log out!',
            style: TextStyle(fontSize: 32.0, color: Colors.black),
          ),
          onPressed: _showMyDialog,
        ));
  }

  Future<void> _showMyDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Log Out!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You have successfully Log Out!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                prefs.clear();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => SignInPage()));
              },
            ),
          ],
        );
      },
    );
  }
}

/*


*/
