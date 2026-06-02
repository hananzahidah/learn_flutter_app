import 'package:flutter/material.dart';
import 'package:flutter_application_1/day_19/database/preference_handler.dart';
import 'package:flutter_application_1/day_20/views/home.dart';
import 'package:flutter_application_1/day_20/views/login.dart';
import 'package:flutter_application_1/extension/navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(Duration(seconds: 4));
    if (!mounted) return;
    if (PreferenceHandler.isLogin) {
      context.pushAndRemoveAll(Home());
    } else {
      context.pushAndRemoveAll(LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF327AF4), Color.fromARGB(255, 0, 25, 187)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              spacing: 10,
              children: [
                Image.asset("assets/images/logo_white.png", height: 170),
                Text(
                  "ResQare",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                Text(
                  "Every report brings hope for them",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            Image.asset("assets/images/splash.png"),
          ],
        ),
      ),
    );
  }
}
