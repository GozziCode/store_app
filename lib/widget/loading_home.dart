import 'package:flutter/material.dart';

import 'loading_skeleton.dart';

class LoadingHome extends StatelessWidget {
  const LoadingHome({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 0.4,
          childAspectRatio: 0.8,
        ),
        itemCount: 4,
        itemBuilder: (_, index) {
          return Container(
            margin: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
            height: screenHeight * 0.35,
            width: screenWidth * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoadingSkeleton(
                  radius: 16,
                  height: screenHeight * 0.15,
                  width: screenWidth * 0.45,
                ),
                const SizedBox(height: 20),
                LoadingSkeleton(
                  radius: 16,
                  height: screenHeight * 0.03,
                  width: screenWidth * 0.25,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoadingSkeleton(
                      radius: 16,
                      height: screenHeight * 0.03,
                      width: screenWidth * 0.25,
                    ),
                    LoadingSkeleton(
                      radius: 50,
                      height: screenHeight * 0.06,
                      width: screenHeight * 0.06,
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
