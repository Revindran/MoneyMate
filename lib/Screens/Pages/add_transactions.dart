import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:money_mate/Components/validator.dart';
import 'package:money_mate/Screens/Pages/home_screen.dart';
import 'package:money_mate/controllers/category_controller.dart';

class AddTransactions extends StatefulWidget {
  @override
  _AddTransactionsState createState() => _AddTransactionsState();
}

bool isLoading = false;

class _AddTransactionsState extends State<AddTransactions> {
  DateTime selectedDate = DateTime.now();
  var storage = GetStorage();
  var email;
  String itemSelected = "", sDate, selCategory, _dropMemoryDownValue;
  var selectedItem = 0;
  final _controller = Get.put<CatController>(CatController());
  final amountString = TextEditingController();
  final sofIncome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Add New Transaction',
          style:
              TextStyle(color: Colors.grey[400], fontStyle: FontStyle.italic),
        ),
      ),
      body: Center(
        child: Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width / 1.1,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: amountString,
                    validator: Validator().amount,
                    decoration: InputDecoration(
                      labelText: 'Enter Amount',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[100],
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: sofIncome,
                    validator: Validator().notEmpty,
                    decoration: InputDecoration(
                      labelText: 'Source of Income',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[100],
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[100]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.calendar_today_outlined), // Refer step 3
                            Text(
                              "${selectedDate.toLocal()}".split(' ')[0],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100]),
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Transaction type",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          DropdownButton(
                            hint: _dropMemoryDownValue == null
                                ? Text('Select Transaction type',
                                    style: TextStyle())
                                : Text(
                                    _dropMemoryDownValue,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                            isExpanded: true,
                            iconSize: 30.0,
                            style: TextStyle(color: Colors.blue),
                            items: [
                              'Income',
                              'Expanse',
                            ].map(
                              (val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(val),
                                );
                              },
                            ).toList(),
                            onChanged: (val) {
                              setState(
                                () {
                                  _dropMemoryDownValue = val;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  _dropMemoryDownValue == null
                      ? Container()
                      : Column(
                          children: [
                            Text(
                              'Select Category',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontStyle: FontStyle.italic),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: Get.width / 1.1,
                              height: Get.height / 3.5,
                              child: GridView.builder(
                                itemCount: _controller.catList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () => {
                                      onCange(
                                          s: _controller.catList[index].index),
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: _controller.catList[
                                                          selectedItem] ==
                                                      _controller.catList[index]
                                                  ? Colors.grey[200]
                                                  : Colors.white),
                                          child: Padding(
                                            padding: EdgeInsets.all(16),
                                            child:
                                                _controller.catList[index].icon,
                                          ),
                                        ),
                                        Text(
                                          _controller.catList[index].title,
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              color: Colors.grey[500]),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                  isLoading
                      ? Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Center(child: CupertinoActivityIndicator()),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 5.0)
                                        ]),
                                    height: 50,
                                    width: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.arrow_forward_sharp,
                                          size: 30,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Save',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {
                                if (_dropMemoryDownValue == null ||
                                    amountString.text == '' ||
                                    sofIncome.text == '') {
                                  Get.snackbar('Please Fill all the fields',
                                      'Please Fill all the fields to continue',
                                      snackPosition: SnackPosition.BOTTOM);
                                } else if (selectedItem == 0) {
                                  Get.snackbar(
                                      'Please select the Category type',
                                      'Please select the Category type to continue',
                                      snackPosition: SnackPosition.BOTTOM);
                                } else {
                                  addIncome().then((value) {
                                    setState(() {
                                      _dropMemoryDownValue = "";
                                      amountString.clear();
                                      sofIncome.clear();
                                    });
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                ],
              ),
            )),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      // initialEntryMode: DatePickerEntryMode.input,
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> addIncome() async {
    isLoading = true;
    email = storage.read('email');
    Map<String, dynamic> dataA = {
      "Income": amountString,
    };
    Map<String, dynamic> data = {
      "Amount": amountString.text,
      "SOI": sofIncome.text,
      "SelectedDate": "${selectedDate.toLocal()}".split(' ')[0],
      "TimeStamp": DateTime.now(),
      "Category": _controller.catList[selectedItem].title.toString(),
      "Type": _dropMemoryDownValue,
    };
    FirebaseFirestore.instance
        .collection('Users')
        .doc(email)
        .collection("Transactions")
        .add(data)
        .then((DocumentReference document) {
      print(document.id);
      setState(() {
        isLoading = false;
      });
      Get.off(() => HomePage());
      Get.snackbar('Upload Successful', 'Upload Successful',
          duration: Duration(seconds: 2), snackPosition: SnackPosition.BOTTOM);
    }).catchError((e) {
      setState(() {
        isLoading = false;
      });
      print(e);
      Get.snackbar('Error', e.toString(),
          duration: Duration(seconds: 2), snackPosition: SnackPosition.BOTTOM);
    });
  }

  void onCange({int s}) {
    setState(() {
      selectedItem = s;
    });
  }
}
