import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../provider/product_provider.dart';

class ErrowWidget extends StatelessWidget {
  final ProductProvider provider;
  const ErrowWidget({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            const Icon(
              Icons.wifi_off_rounded,
              size: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              provider.errorMessage!,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  provider.fetchProducts();
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: AppColors.primaryColor),
                child: const Text(
                  'Try again',
                  style: TextStyle(color: AppColors.white, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
