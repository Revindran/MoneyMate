import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:money_mate/Components/add_note.dart';
import 'package:money_mate/Components/circular_menu.dart';
import 'package:money_mate/Screens/Pages/analytics_screen.dart';
import 'package:money_mate/Screens/Pages/settings_screen.dart';

import 'add_transactions.dart';

const double _fabDimension = 56;

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  var storage = GetStorage();

  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Navigator(
      key: ValueKey(_transitionType),
      onGenerateRoute: (settings) {
        return MaterialPageRoute<void>(
          builder: (context) => Scaffold(
              body: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sizedBoxVertical(),
                    _sizedBoxVertical(),
                    _headerWidget(),
                    _sizedBoxVertical(),
                    _incomeWidget(),
                    _sizedBoxVertical(),
                    _catHScrolls(),
                    _sizedBoxVertical(),
                    _sizedBoxVertical(),
                    _recentTransactions(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _sizedBoxVertical(),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.ac_unit),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Buy'),
                                          Text('5:55 PM'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('-\$82'),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Icon(
                                            CupertinoIcons
                                                .arrow_turn_down_right,
                                            color: Colors.grey[900],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  _sizedBoxVertical(),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _sizedBoxVertical(),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.ac_unit),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Buy'),
                                          Text('5:55 PM'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('-\$82'),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Icon(
                                            CupertinoIcons
                                                .arrow_turn_down_right,
                                            color: Colors.grey[900],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  _sizedBoxVertical(),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _sizedBoxVertical(),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.ac_unit),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Buy'),
                                          Text('5:55 PM'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('-\$82'),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Icon(
                                            CupertinoIcons
                                                .arrow_turn_down_right,
                                            color: Colors.grey[900],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  _sizedBoxVertical(),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _sizedBoxVertical(),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.ac_unit),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Buy'),
                                          Text('5:55 PM'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('-\$82'),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Icon(
                                            CupertinoIcons
                                                .arrow_turn_down_right,
                                            color: Colors.grey[900],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  _sizedBoxVertical(),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _sizedBoxVertical(),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.ac_unit),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Buy'),
                                          Text('5:55 PM'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('-\$82'),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Icon(
                                            CupertinoIcons
                                                .arrow_turn_down_right,
                                            color: Colors.grey[900],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  _sizedBoxVertical(),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _sizedBoxVertical(),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.ac_unit),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Buy'),
                                          Text('5:55 PM'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('-\$82'),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Icon(
                                            CupertinoIcons
                                                .arrow_turn_down_right,
                                            color: Colors.grey[900],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  _sizedBoxVertical(),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _sizedBoxVertical(),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.ac_unit),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Buy'),
                                          Text('5:55 PM'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('-\$82'),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Icon(
                                            CupertinoIcons
                                                .arrow_turn_down_right,
                                            color: Colors.grey[900],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  _sizedBoxVertical(),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _sizedBoxVertical(),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.ac_unit),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Buy'),
                                          Text('5:55 PM'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('-\$82'),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Icon(
                                            CupertinoIcons
                                                .arrow_turn_down_right,
                                            color: Colors.grey[900],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  _sizedBoxVertical(),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _sizedBoxVertical(),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.ac_unit),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Buy'),
                                          Text('5:55 PM'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('-\$82'),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Icon(
                                            CupertinoIcons
                                                .arrow_turn_down_right,
                                            color: Colors.grey[900],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  _sizedBoxVertical(),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _sizedBoxVertical(),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.ac_unit),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Buy'),
                                          Text('5:55 PM'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('-\$82'),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Icon(
                                            CupertinoIcons
                                                .arrow_turn_down_right,
                                            color: Colors.grey[900],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  _sizedBoxVertical(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    right: 30,
                    bottom: 30,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        IgnorePointer(
                          child: Container(
                            color: Colors.transparent,
                            height: 150.0,
                            width: 150.0,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset.fromDirection(
                              getRadiansFromDegree(275),
                              degOneTranslationAnimation.value * 100),
                          child: Transform(
                            transform: Matrix4.rotationZ(
                                getRadiansFromDegree(rotationAnimation.value))
                              ..scale(degOneTranslationAnimation.value),
                            alignment: Alignment.center,
                            child: CircularButton(
                              color: Colors.amber,
                              width: 50,
                              height: 50,
                              icon: Icon(
                                CupertinoIcons.add_circled_solid,
                                color: Colors.white,
                              ),
                              onClick: () {
                                Get.to(() => AddTransactions());
                                animationController.reverse();
                              },
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset.fromDirection(
                              getRadiansFromDegree(240),
                              degOneTranslationAnimation.value * 100),
                          child: Transform(
                            transform: Matrix4.rotationZ(
                                getRadiansFromDegree(rotationAnimation.value))
                              ..scale(degOneTranslationAnimation.value),
                            alignment: Alignment.center,
                            child: CircularButton(
                              color: Colors.amber,
                              width: 50,
                              height: 50,
                              icon: Icon(
                                CupertinoIcons.doc,
                                color: Colors.white,
                              ),
                              onClick: () {
                                Get.to(() => AddNotesPage());
                                animationController.reverse();
                              },
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset.fromDirection(
                              getRadiansFromDegree(205),
                              degTwoTranslationAnimation.value * 100),
                          child: Transform(
                            transform: Matrix4.rotationZ(
                                getRadiansFromDegree(rotationAnimation.value))
                              ..scale(degTwoTranslationAnimation.value),
                            alignment: Alignment.center,
                            child: CircularButton(
                              color: Colors.amber,
                              width: 50,
                              height: 50,
                              icon: Icon(
                                CupertinoIcons.graph_circle,
                                color: Colors.white,
                              ),
                              onClick: () {
                                Get.to(() => AnalyticsPage());
                                animationController.reverse();
                              },
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset.fromDirection(
                              getRadiansFromDegree(170),
                              degThreeTranslationAnimation.value * 100),
                          child: Transform(
                            transform: Matrix4.rotationZ(
                                getRadiansFromDegree(rotationAnimation.value))
                              ..scale(degThreeTranslationAnimation.value),
                            alignment: Alignment.center,
                            child: CircularButton(
                              color: Colors.amber,
                              width: 50,
                              height: 50,
                              icon: Icon(
                                CupertinoIcons.settings,
                                color: Colors.white,
                              ),
                              onClick: () {
                                Get.to(() => SettingsPage());
                                animationController.reverse();
                              },
                            ),
                          ),
                        ),
                        Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value)),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.amber[200],
                            width: 60,
                            height: 60,
                            icon: Icon(
                              Icons.menu,
                              color: Colors.black,
                            ),
                            onClick: () {
                              if (animationController.isCompleted) {
                                animationController.reverse();
                              } else {
                                animationController.forward();
                              }
                            },
                          ),
                        )
                      ],
                    ))
              ],
            ),
          )),
        );
      },
    );
  }
}

Widget _headerWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      children: [
        Container(
            width: 55.0,
            height: 55.0,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image:
                        new NetworkImage("https://i.imgur.com/BoN9kdC.png")))),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nice to see you again",
                style: TextStyle(
                    color: Colors.grey[500], fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "John Doe.",
                style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _sizedBoxVertical() {
  return SizedBox(
    height: 20,
  );
}

Widget _incomeWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your monthly savings",
              style: TextStyle(
                  color: Colors.grey[500], fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("\$"),
                Text(
                  "1307.3",
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ],
            )
          ],
        ),
        Icon(
          FontAwesomeIcons.moneyCheck,
          color: Colors.grey[400],
        )
      ],
    ),
  );
}

Widget _catHScrolls() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                height: Get.height / 11,
                width: Get.width / 5,
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.shopping_basket_outlined),
              ),
            ),
            Text(
              'Transfers',
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                height: Get.height / 11,
                width: Get.width / 5,
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.shopping_basket_outlined),
              ),
            ),
            Text(
              'Transfers',
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                height: Get.height / 11,
                width: Get.width / 5,
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.shopping_basket_outlined),
              ),
            ),
            Text(
              'Transfers',
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                height: Get.height / 11,
                width: Get.width / 5,
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.shopping_basket_outlined),
              ),
            ),
            Text(
              'Transfers',
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                height: Get.height / 11,
                width: Get.width / 5,
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.shopping_basket_outlined),
              ),
            ),
            Text(
              'Transfers',
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                height: Get.height / 11,
                width: Get.width / 5,
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.shopping_basket_outlined),
              ),
            ),
            Text(
              'Transfers',
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                height: Get.height / 11,
                width: Get.width / 5,
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.shopping_basket_outlined),
              ),
            ),
            Text(
              'Transfers',
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                height: Get.height / 11,
                width: Get.width / 5,
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.shopping_basket_outlined),
              ),
            ),
            Text(
              'Transfers',
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                height: Get.height / 11,
                width: Get.width / 5,
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.shopping_basket_outlined),
              ),
            ),
            Text(
              'Transfers',
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                height: Get.height / 11,
                width: Get.width / 5,
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.shopping_basket_outlined),
              ),
            ),
            Text(
              'Transfers',
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _recentTransactions() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          "Your Recent Transactions:",
          style:
              TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w500),
        ),
      ),
    ],
  );
}
