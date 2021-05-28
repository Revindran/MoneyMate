import 'package:flutter/material.dart';

class AnalyticsPage extends StatefulWidget {
  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Your Analytics',
          style:
              TextStyle(color: Colors.grey[400], fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/analytics3.gif",

            ),
            Text(
              'We Are Working on this hardly',
              style: TextStyle(
                  color: Colors.grey[400], fontStyle: FontStyle.italic),
            ),
            Text(
              'Will implement this function soon',
              style: TextStyle(
                  color: Colors.grey[400], fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
