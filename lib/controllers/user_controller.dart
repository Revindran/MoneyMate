import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:money_mate/Screens/Pages/home_screen.dart';

class UserController extends GetxController {
  final _fireStore = FirebaseFirestore.instance;
  var storage = GetStorage();
  var name = '...';
  getUser() {
    var email = storage.read('email');
    _fireStore.collection('Users').doc(email).get().then((value) {
      name = value['Name'];
      update();
    });
  }
}
