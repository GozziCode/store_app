import 'package:flutter/material.dart';
import 'package:store_app/widget/action_button.dart';

import '../provider/product_provider.dart';

class ErrowWidget extends StatelessWidget {
  final ProductProvider provider;
  const ErrowWidget({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final double textScaleFactor = MediaQuery.textScalerOf(context).scale(1.5);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: ListView(
          children: [
            SizedBox(
              height: screenHeight * 0.2,
            ),
            const Icon(
              Icons.wifi_off_rounded,
              size: 100,
            ),
            SizedBox(
              height: screenHeight * .02,
            ),
            Text(
              provider.errorMessage!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14 * textScaleFactor),
            ),
            SizedBox(
              height: screenHeight * .05,
            ),
            ActionButton(
              width: screenWidth * 0.1,
              onPress: () => provider.fetchProducts(),
              title: 'Try again',
            )
          ],
        ),
      ),
    );
  }
}
