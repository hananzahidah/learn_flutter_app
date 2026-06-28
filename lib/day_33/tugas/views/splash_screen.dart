import 'package:flutter/material.dart';
import 'package:flutter_application_1/day_33/tugas/views/anime_list_screen.dart';
import 'package:flutter_application_1/day_33/tugas/views/app_color.dart';
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

    context.pushAndRemoveAll(AnimeListScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    const Color.fromARGB(255, 29, 4, 19).withValues(alpha: 0.06),
                    AppColor.background,
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Container(
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    radius: 0.8,
                    colors: [
                      AppColor.primary.withValues(alpha: 0.15),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/panzu.png", width: 190),

                SizedBox(height: 28),

                Text(
                  "Panzu",
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 52,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1,
                    shadows: [
                      Shadow(
                        color: AppColor.primary.withValues(alpha: 0.35),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "Explore the Anime World",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 32,
            child: SafeArea(
              child: Center(
                child: Text(
                  "Powered by Jikan API",
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.25),
                    fontSize: 11,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
