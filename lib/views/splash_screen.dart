import 'dart:async';

import 'package:flutter/material.dart';
import 'package:store_app/constant/constant.dart';
import 'package:store_app/views/home_screen.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({super.key});

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  startTimer() async {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (c) => const HomeScreen()
              // const StartScreen()
              ));
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final double textScaleFactor = MediaQuery.textScalerOf(context).scale(1.5);

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.store_rounded,
              size: 100,
              color: AppColors.primaryColor,
            ),
            Text(
              "Spicey.",
              style: TextStyle(
                  fontSize: 50 * textScaleFactor,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
