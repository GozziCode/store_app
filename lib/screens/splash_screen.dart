import 'dart:async';

import 'package:flutter/material.dart';
import 'package:store_app/constant/constant.dart';
import 'package:store_app/screens/home_screen.dart';

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
    return const Scaffold(
      body: Center(
        child: Text(
          "Caketins.",
          style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: AppColors.orangeDark),
        ),
      ),
    );
  }
}
