import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_mate/Screens/Auth/signup_screen.dart';
import 'package:money_mate/Components/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _email;

  String _password;

  bool _isLoading = false;

  @override
  void initState() {
    _email = "";
    _password = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                const SizedBox(height: 150.0),
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
                        "Hello",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                            ),
                      ),
                      Text(
                        "Sign in your account",
                        style: Theme.of(context).textTheme.headline6,
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
                      const SizedBox(height: 16.0),
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
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Forgot your Password?")),
                      const SizedBox(height: 20.0),
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
                                onPressed: () {
                                  _validateAndAuth();
                                },
                                child: Text("Login"),
                              ),
                            ),
                      const SizedBox(height: 20.0),
                      Text(
                        "Or Login using social media",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(FontAwesomeIcons.google),
                            color: Colors.indigo,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(FontAwesomeIcons.twitter),
                            color: Colors.blue,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    const SizedBox(height: 5.0),
                    InkWell(
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => SignUpPage()));
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

  void _validateAndAuth() {
    if (_email.isEmpty || _password.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please Fill all the fields to upload",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      setState(() {
        _isLoading = true;
      });
      _authUser();
    }
  }

  void _authUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password)
          .then(
        (result) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('email', _email);
          return null;
        },
      ).then((value) => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomBar())));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          _isLoading = false;
        });
        Fluttertoast.showToast(
            msg: "No user found for that email.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
        print('No user found for that email.');
        setState(() {
          _isLoading = false;
        });
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: "Wrong password provided for that user.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
        print('Wrong password provided for that user.');
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print(e);
    }
  }
}
