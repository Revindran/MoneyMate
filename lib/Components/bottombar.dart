import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/Screens/Pages/analytics_screen.dart';
import 'package:money_mate/Screens/Pages/home_screen.dart';
import 'package:money_mate/Screens/Pages/notes_screen.dart';
import 'package:money_mate/Screens/Pages/settings_screen.dart';

class NewBottomBar extends StatefulWidget {
  const NewBottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<NewBottomBar> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomePage(),
            AnalyticsPage(),
            NotesPage(),
            SettingsPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        animationDuration: Duration(microseconds: 1000),
        curve: Curves.easeInOut,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Home'),
            icon: Icon(CupertinoIcons.home),
            activeColor: CupertinoColors.systemGrey,
            inactiveColor: CupertinoColors.systemGrey,
            // textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            title: Text('Analytics'),
            icon: Icon(CupertinoIcons.graph_circle),
            activeColor: CupertinoColors.systemGrey,
            inactiveColor: CupertinoColors.systemGrey,
            // textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            title: Text('Notes'),
            icon: Icon(CupertinoIcons.doc),
            activeColor: CupertinoColors.systemGrey,
            inactiveColor: CupertinoColors.systemGrey,
            // textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            title: Text('Settings'),
            icon: Icon(CupertinoIcons.settings),
            activeColor: CupertinoColors.systemGrey,
            inactiveColor: CupertinoColors.systemGrey,
            // textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
