import 'package:flutter/material.dart';

import '../constant/constant.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.onPress,
    required this.title,
    this.color,
    this.height,
    this.width,
    this.textColor,
    this.textSize,
  });
  final Color? color;
  final Color? textColor;
  final VoidCallback? onPress;
  final String title;
  final double? height;
  final double? width;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    final double textScaleFactor = MediaQuery.textScalerOf(context).scale(1.5);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height ?? screenHeight * .07,
      width: width ?? screenWidth * 0.1,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
            backgroundColor: color ?? AppColors.primaryColor),
        child: Text(
          title,
          style: TextStyle(
              color: textColor ?? AppColors.white,
              fontSize: textSize ?? 18 * textScaleFactor),
        ),
      ),
    );
  }
}
