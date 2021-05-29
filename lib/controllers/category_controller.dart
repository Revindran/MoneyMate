import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_mate/models/category_model.dart';

class CatController extends GetxController{
  var catList =[
    CatModel(0, 'None', Icon(Icons.hourglass_empty)),
    CatModel(1, 'Interest', Icon(Icons.money)),
    CatModel(2, 'Deposit', Icon(Icons.money)),
    CatModel(3, 'Business', Icon(Icons.money)),
    CatModel(4, 'Salary', Icon(Icons.money)),
    CatModel(5, 'Recharge', Icon(Icons.money)),
    CatModel(6, 'Reward', Icon(Icons.money)),
    CatModel(7, 'Return', Icon(Icons.money)),
    CatModel(8, 'Bank', Icon(Icons.money)),
    CatModel(9, 'Credit', Icon(Icons.money)),
    CatModel(10, 'Transfer', Icon(Icons.money)),
    CatModel(11, 'Loan', Icon(Icons.money)),
    CatModel(12, 'Bill', Icon(Icons.money)),
  ].obs;

}