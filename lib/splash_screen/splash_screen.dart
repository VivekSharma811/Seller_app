import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seller_app/auth/auth_screen.dart';
import 'package:seller_app/global/global.dart';
import 'package:seller_app/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      if(firebaseAuth.currentUser != null) {
        Navigator.push(context, MaterialPageRoute(builder: (c) => const HomeScreen()));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (c) => const AuthScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/splash.jpeg"),
              const SizedBox(height: 10),
              const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "Sell Food Online",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 40,
                        fontFamily: "Signatra",
                        letterSpacing: 3),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
