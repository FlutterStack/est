import 'dart:async';
// import 'package:expert_properties/components/foldables_sidebar.dart';
// import 'package:expert_properties/components/menuDashboard.dart';
import 'package:expert_properties/login/LoginScreen.dart';
// import 'package:expert_properties/screens/first_page.dart';
import 'package:flutter/material.dart';
// import 'components/menuDashboard.dart';
// import 'screens/first_page.dart';

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
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Image.asset('assets/images/logob.jpg'),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text(
                'Powered by',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Image(
                width: 100,
                height: 50,
                image: AssetImage('assets/images/fx.webp'),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
