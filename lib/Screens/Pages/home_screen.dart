import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool anim;

  @override
  void initState() {
    setState(() {
      anim = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
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
                padding: const EdgeInsets.only(top: 30),
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
        ListView(
          children: [
            const SizedBox(height: 50.0),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 16),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 1.0,
                    offset: Offset(
                      0.0, // Move to right 10  horizontally
                      10.0, // Move to bottom 10 Vertically
                    ),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        new CircularPercentIndicator(
                          radius: 150.0,
                          lineWidth: 14.0,
                          animation: anim,
                          percent: 0.7,
                          center: new Text(
                            "Total \n70.0%",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.amber,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey.shade200),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Month'),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey.shade200),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Month'),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey.shade200),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Month'),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey.shade200),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Month'),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey.shade200),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Month'),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey.shade200),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Month'),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey.shade200),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Month'),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey.shade200),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Month'),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 1.0,
                    offset: Offset(
                      0.0, // Move to right 10  horizontally
                      10.0, // Move to bottom 10 Vertically
                    ),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Text('Income'),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 1.0,
                    offset: Offset(
                      0.0, // Move to right 10  horizontally
                      10.0, // Move to bottom 10 Vertically
                    ),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                  child: Text('Expanse'), onTap: () {}),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(CupertinoIcons.chart_bar_square),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(CupertinoIcons.chart_bar_square),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(CupertinoIcons.chart_bar_square),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(CupertinoIcons.chart_bar_square),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(CupertinoIcons.chart_bar_square),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(CupertinoIcons.chart_bar_square),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(CupertinoIcons.chart_bar_square),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(CupertinoIcons.chart_bar_square),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 1.0,
                    offset: Offset(
                      0.0, // Move to right 10  horizontally
                      10.0, // Move to bottom 10 Vertically
                    ),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Text('Income'),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(Icons.local_grocery_store_outlined),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 1.0,
                    offset: Offset(
                      0.0, // Move to right 10  horizontally
                      10.0, // Move to bottom 10 Vertically
                    ),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                  child: Text('Expanse'), onTap: () {}),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(CupertinoIcons.chart_bar_square),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(CupertinoIcons.chart_bar_square),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(CupertinoIcons.chart_bar_square),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(CupertinoIcons.chart_bar_square),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(CupertinoIcons.chart_bar_square),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(CupertinoIcons.chart_bar_square),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(CupertinoIcons.chart_bar_square),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(CupertinoIcons.chart_bar_square),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Groceries'),
                                    Text("& 8,450"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
