import 'package:flutter/material.dart';

import 'loading_skeleton.dart';

class LoadingHome extends StatelessWidget {
  const LoadingHome({super.key});

  @override
  Widget build(BuildContext context) {
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
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            height: 300,
            width: 200,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoadingSkeleton(
                  radius: 16,
                  height: 120,
                  width: 200,
                ),
                SizedBox(height: 20),
                LoadingSkeleton(
                  radius: 16,
                  height: 25,
                  width: 100,
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoadingSkeleton(
                      radius: 16,
                      height: 25,
                      width: 100,
                    ),
                    LoadingSkeleton(
                      radius: 50,
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
