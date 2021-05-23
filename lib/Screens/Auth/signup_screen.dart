import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:money_mate/Components/bottombar.dart';
import 'package:money_mate/Screens/Auth/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _fName, _email, _password;

  bool _isLoading = false;

  var storage = GetStorage();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final firestoreInstance = FirebaseFirestore.instance;

  @override
  void initState() {
    _fName = "";
    _email = "";
    _password = "";
    super.initState();
  }

  final snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade300,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.8,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(40)),
                    color: Colors.amber),
              )
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Text(
                    "Money Mate",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                  ),
                ),
                Text(
                  "Track Your Money Flow",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                        color: Colors.grey.shade800,
                      ),
                ),
              ],
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                const SizedBox(height: 120.0),
                Container(
                  margin: const EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Text(
                        "Welcome",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                            ),
                      ),
                      Text(
                        "Sign up your account",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Full Name",
                        ),
                        onChanged: (value) {
                          _fName = value;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email address",
                        ),
                        onChanged: (value) {
                          _email = value;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password",
                        ),
                        onChanged: (value) {
                          _password = value;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      _isLoading
                          ? CircularProgressIndicator()
                          : Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                padding: const EdgeInsets.all(16.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                color: Colors.amber,
                                textColor: Colors.white,
                                onPressed: () async {
                                  _validateAndRegister();
                                },
                                child: Text("Let\'s Go"),
                              ),
                            ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    const SizedBox(height: 5.0),
                    InkWell(
                      child: Text(
                        "SignIn",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => SignInPage()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _validateAndRegister() {
    if (_fName.isEmpty || _email.isEmpty || _password.isEmpty) {
      Get.snackbar('Please Fill all the fields to Continue.',
          'Please Fill all the fields to Continue.',
          duration: Duration(seconds: 3),snackPosition: SnackPosition.BOTTOM);
    } else {
      setState(() {
        _isLoading = true;
      });
      _registerUser();
    }
  }

  void _registerUser() async {
    Map<String, dynamic> data = {
      "First Name": _fName,
      "email": _email,
      "password": _password,
      "timeStamp": DateTime.now(),
    };
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then(
        (result) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('email', _email);
          storage.write('email', _email);
          setState(() {
            _isLoading = false;
          });
          firestoreInstance
              .collection("Users")
              .doc("All")
              .collection(firebaseAuth.currentUser.email)
              .add(data);
        },
      ).then((value) => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => NewBottomBar())));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState(() {
          _isLoading = false;
        });
        Get.snackbar('The password provided is too weak.',
            'The password provided is too weak.',
            duration: Duration(seconds: 3),snackPosition: SnackPosition.BOTTOM);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          _isLoading = false;
        });
        Get.snackbar('The account already exists for that email.',
            'The account already exists for that email.',
            duration: Duration(seconds: 3),snackPosition: SnackPosition.BOTTOM);
        print('The account already exists for that email.');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print(e);
    }
  }
}
