import 'package:flutter/material.dart';

class LoadingSkeleton extends StatelessWidget {
  final double? height;
  final double? width;

  const LoadingSkeleton({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.circular(16)),
    );
  }
}
