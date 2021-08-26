import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNotesPage extends StatefulWidget {
  @override
  _AddNotesPageState createState() => _AddNotesPageState();
}

DateTime dateTime = DateTime.now();
String yyMMdd = dateTime.toIso8601String().split('T').first;

class _AddNotesPageState extends State<AddNotesPage> {
  late String noteText;
  late String titleText;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Add a New Note',style: TextStyle(color: Colors.grey[400],fontStyle: FontStyle.italic),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
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
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Add Note'),
              validator: (value) {
                return (value!.isEmpty ? 'Please Add some Note to save ' : null);
              },
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              onChanged: (val) {
                noteText = val;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    addNote().then((value) {
                      Get.snackbar(
                          'The Note has Added successfully..', 'The Note has Added successfully',
                          snackPosition: SnackPosition.BOTTOM,
                          duration: Duration(seconds: 3),
                          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
                          colorText: Get.theme.snackBarTheme.actionTextColor);
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
        .doc(_auth.currentUser!.email)
        .collection("Notes")
        .add(data)
        .then((DocumentReference document) {
      print(document.id);
    }).catchError((e) {
      print(e);
    });
  }
}
