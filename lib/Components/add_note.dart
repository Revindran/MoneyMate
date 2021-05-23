import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddNotesPage extends StatefulWidget {
  @override
  _AddNotesPageState createState() => _AddNotesPageState();
}

DateTime dateTime = DateTime.now();
String yyMMdd = dateTime.toIso8601String().split('T').first;

class _AddNotesPageState extends State<AddNotesPage> {
  String noteText;
  String titleText;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Note'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Title'),
            validator: (value) {
              return (value == null ? 'Please Give the Heading ' : null);
            },
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            onChanged: (val) {
              titleText = val;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Add Note'),
            validator: (value) {
              return (value.isEmpty ? 'Please Add some Note to save ' : null);
            },
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            onChanged: (val) {
              noteText = val;
            },
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    addNote().then((value) {
                      Fluttertoast.showToast(
                        msg: "The Note has Added successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                      );
                      Navigator.pop(context);
                    });
                  },
                  child: Text('Add')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
            ],
          )
        ],
      ),
    );
  }

  Future<void> addNote() async {
    Map<String, dynamic> data = {
      "Note": noteText,
      "title": titleText,
      "created": yyMMdd,
      "updated": "",
      "timeStamp": Timestamp.now(),
    };
    FirebaseFirestore.instance
        .collection('Users')
        .doc(_auth.currentUser.email)
        .collection("Notes")
        .add(data)
        .then((DocumentReference document) {
      print(document.id);
    }).catchError((e) {
      print(e);
    });
  }
}
