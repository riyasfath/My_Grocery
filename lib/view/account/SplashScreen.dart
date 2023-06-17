import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_grocery/view/dashboard/dashboard_screen.dart';
import 'package:my_grocery/view/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/splash.jpg',
            width: 400,
            height: 400,
            ),
            SizedBox(
              height: 10,

            ),
            Text(
              'onDoor',
              style: TextStyle(
                fontSize: 60,
                color: Colors.orange,
                fontWeight: FontWeight.bold

              ),
            )
          ],
        ),
      ),


    );
  }
}
