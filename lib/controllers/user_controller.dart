import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:money_mate/Screens/Pages/home_screen.dart';

class UserController extends GetxController {
  final _fireStore = FirebaseFirestore.instance;
  var storage = GetStorage();
  var name = '...';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxInt totalBalance = 0.obs, totalExpanse = 0.obs;

  getUser() {
    var email = storage.read('email');
    _fireStore.collection('Users').doc(email).get().then((value) {
      name = value['Name'];
      update();
    });
  }

  Future<void> sendPasswordResetEmail(BuildContext context,
      {String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar('Resetting Password'.tr, 'Resetting Password please wait'.tr,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 5),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    } on FirebaseAuthException catch (error) {
      Get.snackbar('Error', error.message,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  totalAmountCalculations() {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(email)
        .collection('Transactions')
        .get()
        .then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        QueryDocumentSnapshot snapshot = value.docs[i];
        if (snapshot['Type'] == 'Income')
          totalBalance += int.parse(snapshot['Amount']);
        else if (snapshot['Type'] == 'Expanse')
          totalExpanse += int.parse(snapshot['Amount']);
        update();
      }
    });
  }

}
