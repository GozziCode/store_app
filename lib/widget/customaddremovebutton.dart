import 'package:flutter/material.dart';

import '../constant/constant.dart';

class CustomAddRemoveButton extends StatelessWidget {
  final VoidCallback? removeItem;
  final VoidCallback? addItem;
  final String quantity;
  final double? width;
  final double? height;

  const CustomAddRemoveButton({
    super.key,
    this.removeItem,
    this.addItem,
    required this.quantity,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * .3,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InkWell(
          onTap: removeItem,
          splashColor: Colors.deepOrangeAccent,
          child: Container(
            height: height ?? size.height * .04,
            width: width ?? size.width * .08,
            decoration: BoxDecoration(
                color: AppColors.cardBgColor,
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: Text(
                '-',
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
        Text(quantity,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        GestureDetector(
          onTap: addItem,
          child: Container(
            height: height ?? size.height * .04,
            width: width ?? size.width * .08,
            decoration: BoxDecoration(
                color: AppColors.cardBgColor,
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: Text(
                '+',
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
