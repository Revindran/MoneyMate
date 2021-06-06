import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:money_mate/inocme_expence_chart/categories_row.dart';
import 'package:money_mate/inocme_expence_chart/pie_chart_view.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

var storage = GetStorage();
final _firStore = FirebaseFirestore.instance;
var email = storage.read('email');

class AnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Analytics',
          style:
              TextStyle(color: Colors.grey[400], fontStyle: FontStyle.italic),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Income & Expenses',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize: 16),
                  ),
                  _sizedBoxVertical(),
                  Container(
                    width: Get.width / 1.1,
                    height: Get.height / 5,
                    child: Row(
                      children: <Widget>[
                        PieChartView(),
                        CategoriesRow(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _sizedBoxVertical(),
          _sizedBoxVertical(),
          _catHScrolls(),
        ],
      ),
    );
  }
}

Widget _sizedBoxVertical() {
  return SizedBox(
    height: 20,
  );
}

Widget _catHScrolls() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          "Your Recent Categories",
          style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontSize: 16),
        ),
      ),
      _sizedBoxVertical(),
      StreamBuilder<QuerySnapshot>(
          stream: _firStore
              .collection('Users')
              .doc(email)
              .collection('Transactions')
              .orderBy("TimeStamp", descending: true)
              .snapshots(),
          // ignore: missing_return
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> querySnapshot) {
            if (querySnapshot.hasError) return Center(child: Text('Has Error'));
            if (querySnapshot.connectionState == ConnectionState.waiting) {
              CupertinoActivityIndicator();
            }
            if (querySnapshot.data == null) {
              return Center(
                child: Text('Error:|'),
              );
            }
            if (querySnapshot.data.size == 0) {
              return _noTransactions();
            } else {
              return Container(
                height: Get.height / 1.8,
                child: GridView.builder(
                  itemCount: querySnapshot.data.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    final DocumentSnapshot myTransaction =
                        querySnapshot.data.docs[index];
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(100)),
                              child: Image(
                                image: AssetImage(
                                    "assets/${myTransaction['Category'].toString().toLowerCase()}_icon.png"),
                                width: 30,
                                height: 30,
                                color: null,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          Text(
                            myTransaction['Category'] ?? 'N/A',
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            "₹ " + myTransaction['Amount'] ?? 'N/A',
                            style: TextStyle(
                                color: myTransaction['Type'] == 'Income'
                                    ? Colors.green[500]
                                    : Colors.red[500],
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          }),
    ],
  );
}

Widget _noTransactions() {
  return Container(
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/no_transactions.gif",
        ),
        Text(
          'No Transactions Found in your History',
          style:
              TextStyle(color: Colors.grey[400], fontStyle: FontStyle.italic),
        ),
        Text(
          'Try create one and Save Money',
          style:
              TextStyle(color: Colors.grey[400], fontStyle: FontStyle.italic),
        ),
      ],
    )),
  );
}
