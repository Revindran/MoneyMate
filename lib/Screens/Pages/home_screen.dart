import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:money_mate/Components/circular_menu.dart';
import 'package:money_mate/Screens/Pages/analytics_screen.dart';
import 'package:money_mate/Screens/Pages/settings_screen.dart';
import 'package:money_mate/controllers/local_notifications.dart';
import 'package:money_mate/controllers/user_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/gestures.dart';
import 'add_transactions.dart';
import 'notes_screen.dart';

const double _fabDimension = 56;

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var storage = GetStorage();
final _firStore = FirebaseFirestore.instance;
var email = storage.read('email');
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

  final _controller = Get.find<LocalNotificationsController>();
  final UserController _userController = Get.find();

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
    _userController.getUser();
    _controller.initialize();
    _controller.configureLocalTimeZone();
    _controller.nextInstanceOfTenAM();
    _controller.scheduleDailyTenAMNotification();
    _userController.totalExpanse = 0.obs;
    _userController.totalIncome = 0.obs;
    _userController.totalAmountCalculations();
  }

  double totalIncome = 0, totalExpanse = 0;
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
              _sizedBoxVertical(),
              _incomeWidget(),
              _sizedBoxVertical(),
              _catHScrolls(),
              _sizedBoxVertical(),
              _sizedBoxVertical(),
              _recentTransactions(),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: _firStore
                        .collection('Users')
                        .doc(email)
                        .collection('Transactions')
                        .orderBy("TimeStamp", descending: true)
                        .snapshots(),
                    // ignore: missing_return
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> querySnapshot) {
                      if (querySnapshot.hasError)
                        return Center(child: Text('Has Error'));
                      if (querySnapshot.connectionState ==
                          ConnectionState.waiting) {
                        CupertinoActivityIndicator();
                      }
                      if (querySnapshot.data == null) {
                        return Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }
                      if (querySnapshot.data.size == 0) {
                        return _noTransactions();
                      } else {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          shrinkWrap: true,
                          itemCount: querySnapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot myTransaction =
                                querySnapshot.data.docs[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: myTransaction['Type'] == 'Income'
                                          ? Colors.green[50]
                                          : Colors.red[50],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.money,
                                            color: Colors.grey[700],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(myTransaction['SOI'] ??
                                                  'N/A'),
                                              Text(myTransaction[
                                                      'SelectedDate'] ??
                                                  'N/A'),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              myTransaction['Type'] == 'Income'
                                                  ? Text(
                                                      myTransaction['Amount'] ??
                                                          'N/A',
                                                      style: TextStyle(
                                                          color: Colors.green),
                                                    )
                                                  : Text(
                                                      myTransaction['Amount'] ??
                                                          'N/A',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.redAccent),
                                                    ),
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
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                    }),
              ),
            ],
          ),
          Positioned(
              right: 20,
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
                    offset: Offset.fromDirection(getRadiansFromDegree(275),
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
                          // context.navigator.push(AddTransactions()
                          //     .vxPreviewRoute(parentContext: context));
                          Get.to(() => AddTransactions());
                          animationController.reverse();
                        },
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(240),
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
                          // context.navigator.push(NotesPage()
                          //     .vxPreviewRoute(parentContext: context));
                          Get.to(() => NotesPage());
                          animationController.reverse();
                        },
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(205),
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
                    offset: Offset.fromDirection(getRadiansFromDegree(170),
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
    ));
  }

  Widget _headerWidget() {
    return GestureDetector(
      onTap: () => Get.to(SettingsPage()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Hero(
              tag: 'tag',
              child: GetBuilder<UserController>(builder: (_) {
                return Container(
                    width: 55.0,
                    height: 55.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: _userController.photoUrl.toString().isEmpty
                                ? AssetImage('assets/user_pic.png')
                                : NetworkImage(
                                    _userController.photoUrl.toString()))));
              }),
            ),
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
                  GetBuilder<UserController>(
                    builder: (_) => Shimmer.fromColors(
                      baseColor: Colors.grey[900],
                      highlightColor: Colors.grey[200],
                      child: Text('${_userController.name}',
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _incomeWidget() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Your monthly Income",
                    style: TextStyle(
                        color: Colors.grey[500], fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text("₹"),
                      Obx(() {
                        return Text(
                          _userController.totalIncome.toString(),
                          style: TextStyle(
                              color: Colors.green[500],
                              fontWeight: FontWeight.bold,
                              fontSize: 35),
                        );
                      })
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Your monthly Expanses",
                    style: TextStyle(
                        color: Colors.grey[500], fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text("₹"),
                      Obx(() {
                        return Text(
                          _userController.totalExpanse.toString(),
                          style: TextStyle(
                              color: Colors.red[400],
                              fontWeight: FontWeight.bold,
                              fontSize: 35),
                        );
                      })
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
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
          style:
              TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w500),
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
              return Center(
                child: Text(
                  'No Transactions Data Found!',
                  style: TextStyle(
                      color: Colors.grey[400], fontStyle: FontStyle.italic),
                ),
              );
            } else {
              return Container(
                height: 115,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  shrinkWrap: true,
                  itemCount: querySnapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot myTransaction =
                        querySnapshot.data.docs[index];
                    return Row(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: Get.height / 11,
                                  width: Get.width / 5,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Icon(Icons.shopping_basket_outlined),
                                ),
                              ),
                              Text(
                                myTransaction['Category'] ?? 'N/A',
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          }),
    ],
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
