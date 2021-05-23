import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTransactions extends StatefulWidget {
  @override
  _AddTransactionsState createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  DateTime selectedDate = DateTime.now();

  String itemSelected = "",
      amountString,
      sofIncome,
      sDate,
      selCategory,
      _dropMemoryDownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add New Transaction',
          style: TextStyle(fontSize: 25, color: Colors.black45),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width / 1.1,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue.shade50),
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          amountString = value;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.send),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue.shade50,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: "Enter Amount",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue.shade50),
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          sofIncome = value;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.send),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue.shade50,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: "Source of Income",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue.shade50),
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
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue.shade50),
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
                  _dropMemoryDownValue == null
                      ? Container()
                      : _dropMemoryDownValue == 'Income'
                      ? Container(
                    height: MediaQuery.of(context).size.height / 3.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.0,
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Choose the category',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5.0)
                                    ],
                                    color: itemSelected == 'Interest'
                                        ? Colors.blue.shade50
                                        : Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 40,
                                      ),
                                      Text('Interest')
                                    ],
                                  )),
                              onTap: () {
                                setState(() {
                                  itemSelected = 'Interest';
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5.0)
                                    ],
                                    color: itemSelected == 'Deposit'
                                        ? Colors.blue.shade50
                                        : Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 40,
                                      ),
                                      Text('Deposit')
                                    ],
                                  )),
                              onTap: () {
                                setState(() {
                                  itemSelected = 'Deposit';
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5.0)
                                    ],
                                    color: itemSelected == 'Business'
                                        ? Colors.blue.shade50
                                        : Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 40,
                                      ),
                                      Text('Business')
                                    ],
                                  )),
                              onTap: () {
                                setState(() {
                                  itemSelected = 'Business';
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5.0)
                                    ],
                                    color: itemSelected == 'Salary'
                                        ? Colors.blue.shade50
                                        : Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 40,
                                      ),
                                      Text('Salary')
                                    ],
                                  )),
                              onTap: () {
                                setState(() {
                                  itemSelected = 'Salary';
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5.0)
                                    ],
                                    color: itemSelected == 'Recharge'
                                        ? Colors.blue.shade50
                                        : Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 40,
                                      ),
                                      Text('Recharge')
                                    ],
                                  )),
                              onTap: () {
                                setState(() {
                                  itemSelected = 'Recharge';
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5.0)
                                    ],
                                    color: itemSelected == 'Reward'
                                        ? Colors.blue.shade50
                                        : Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 40,
                                      ),
                                      Text('Reward')
                                    ],
                                  )),
                              onTap: () {
                                setState(() {
                                  itemSelected = 'Reward';
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5.0)
                                    ],
                                    color: itemSelected == 'Return'
                                        ? Colors.blue.shade50
                                        : Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 40,
                                      ),
                                      Text('Return')
                                    ],
                                  )),
                              onTap: () {
                                setState(() {
                                  itemSelected = 'Return';
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5.0)
                                    ],
                                    color: itemSelected == 'Bank'
                                        ? Colors.blue.shade50
                                        : Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 40,
                                      ),
                                      Text('Bank')
                                    ],
                                  )),
                              onTap: () {
                                setState(() {
                                  itemSelected = 'Bank';
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5.0)
                                    ],
                                    color: itemSelected == 'Credit'
                                        ? Colors.blue.shade50
                                        : Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 40,
                                      ),
                                      Text('Credit')
                                    ],
                                  )),
                              onTap: () {
                                setState(() {
                                  itemSelected = 'Credit';
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5.0)
                                    ],
                                    color: itemSelected == 'Transfer'
                                        ? Colors.blue.shade50
                                        : Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 40,
                                      ),
                                      Text('Transfer')
                                    ],
                                  )),
                              onTap: () {
                                setState(() {
                                  itemSelected = 'Transfer';
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5.0)
                                    ],
                                    color: itemSelected == 'Loan'
                                        ? Colors.blue.shade50
                                        : Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 40,
                                      ),
                                      Text('Loan')
                                    ],
                                  )),
                              onTap: () {
                                setState(() {
                                  itemSelected = 'Loan';
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5.0)
                                    ],
                                    color: itemSelected == 'Bill'
                                        ? Colors.blue.shade50
                                        : Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 40,
                                      ),
                                      Text('Bill')
                                    ],
                                  )),
                              onTap: () {
                                setState(() {
                                  itemSelected = 'Bill';
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                      :Container(
                    height: MediaQuery.of(context).size.height / 3.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.0,
                          )
                        ]),
                    child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Choose the category',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0)
                                              ],
                                              color: itemSelected == 'Interest'
                                                  ? Colors.blue.shade50
                                                  : Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  size: 40,
                                                ),
                                                Text('Interest')
                                              ],
                                            )),
                                        onTap: () {
                                          setState(() {
                                            itemSelected = 'Interest';
                                          });
                                        },
                                      ),
                                      InkWell(
                                        child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0)
                                              ],
                                              color: itemSelected == 'Deposit'
                                                  ? Colors.blue.shade50
                                                  : Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  size: 40,
                                                ),
                                                Text('Deposit')
                                              ],
                                            )),
                                        onTap: () {
                                          setState(() {
                                            itemSelected = 'Deposit';
                                          });
                                        },
                                      ),
                                      InkWell(
                                        child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0)
                                              ],
                                              color: itemSelected == 'Business'
                                                  ? Colors.blue.shade50
                                                  : Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  size: 40,
                                                ),
                                                Text('Business')
                                              ],
                                            )),
                                        onTap: () {
                                          setState(() {
                                            itemSelected = 'Business';
                                          });
                                        },
                                      ),
                                      InkWell(
                                        child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0)
                                              ],
                                              color: itemSelected == 'Salary'
                                                  ? Colors.blue.shade50
                                                  : Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  size: 40,
                                                ),
                                                Text('Salary')
                                              ],
                                            )),
                                        onTap: () {
                                          setState(() {
                                            itemSelected = 'Salary';
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0)
                                              ],
                                              color: itemSelected == 'Recharge'
                                                  ? Colors.blue.shade50
                                                  : Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  size: 40,
                                                ),
                                                Text('Recharge')
                                              ],
                                            )),
                                        onTap: () {
                                          setState(() {
                                            itemSelected = 'Recharge';
                                          });
                                        },
                                      ),
                                      InkWell(
                                        child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0)
                                              ],
                                              color: itemSelected == 'Reward'
                                                  ? Colors.blue.shade50
                                                  : Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  size: 40,
                                                ),
                                                Text('Reward')
                                              ],
                                            )),
                                        onTap: () {
                                          setState(() {
                                            itemSelected = 'Reward';
                                          });
                                        },
                                      ),
                                      InkWell(
                                        child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0)
                                              ],
                                              color: itemSelected == 'Return'
                                                  ? Colors.blue.shade50
                                                  : Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  size: 40,
                                                ),
                                                Text('Return')
                                              ],
                                            )),
                                        onTap: () {
                                          setState(() {
                                            itemSelected = 'Return';
                                          });
                                        },
                                      ),
                                      InkWell(
                                        child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0)
                                              ],
                                              color: itemSelected == 'Bank'
                                                  ? Colors.blue.shade50
                                                  : Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  size: 40,
                                                ),
                                                Text('Bank')
                                              ],
                                            )),
                                        onTap: () {
                                          setState(() {
                                            itemSelected = 'Bank';
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0)
                                              ],
                                              color: itemSelected == 'Credit'
                                                  ? Colors.blue.shade50
                                                  : Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  size: 40,
                                                ),
                                                Text('Credit')
                                              ],
                                            )),
                                        onTap: () {
                                          setState(() {
                                            itemSelected = 'Credit';
                                          });
                                        },
                                      ),
                                      InkWell(
                                        child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0)
                                              ],
                                              color: itemSelected == 'Transfer'
                                                  ? Colors.blue.shade50
                                                  : Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  size: 40,
                                                ),
                                                Text('Transfer')
                                              ],
                                            )),
                                        onTap: () {
                                          setState(() {
                                            itemSelected = 'Transfer';
                                          });
                                        },
                                      ),
                                      InkWell(
                                        child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0)
                                              ],
                                              color: itemSelected == 'Loan'
                                                  ? Colors.blue.shade50
                                                  : Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  size: 40,
                                                ),
                                                Text('Loan')
                                              ],
                                            )),
                                        onTap: () {
                                          setState(() {
                                            itemSelected = 'Loan';
                                          });
                                        },
                                      ),
                                      InkWell(
                                        child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0)
                                              ],
                                              color: itemSelected == 'Bill'
                                                  ? Colors.blue.shade50
                                                  : Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  size: 40,
                                                ),
                                                Text('Bill')
                                              ],
                                            )),
                                        onTap: () {
                                          setState(() {
                                            itemSelected = 'Bill';
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                  ),
                  Padding(
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
                                        color: Colors.black12, blurRadius: 5.0)
                                  ]),
                              height: 50,
                              width: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                          addIncome();
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
   /* Map<String, dynamic> dataA = {
      "Income": amountString,
    };
    Map<String, dynamic> data = {
      "Amount": amountString,
      "SOI": sofIncome,
      "SelectedDate": "${selectedDate.toLocal()}".split(' ')[0],
      "TimeStamp": DateTime.now(),
      "Category": itemSelected,
      "Type": _dropMemoryDownValue,
    };
    FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.displayName)
        .collection("Transactions")
        .add(data)
        .then((DocumentReference document) {
      print(document.id);
    }).catchError((e) {
      print(e);
    });*/
    Get.snackbar('Upload Successful', 'Upload Successful',
        duration: Duration(seconds: 2), snackPosition: SnackPosition.BOTTOM);

  }
}
