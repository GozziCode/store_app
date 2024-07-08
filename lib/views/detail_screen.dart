import 'package:flutter/material.dart';
import 'package:store_app/constant/constant.dart';
import 'package:store_app/widget/action_button.dart';

import '../models/product_model.dart';
import '../widget/customaddremovebutton.dart';

class DetailScreen extends StatefulWidget {
  final Item productItem;
  final String imgUrl;

  const DetailScreen(
      {super.key, required this.productItem, required this.imgUrl});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double textScaleFactor = MediaQuery.textScalerOf(context).scale(1);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: const Icon(
                  Icons.favorite,
                  color: AppColors.primaryColor,
                  size: 22,
                )),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: ListView(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  '${widget.imgUrl}${widget.productItem.photos![selectedIndex].url}',
                  height: screenHeight * 0.323,
                  width: screenWidth * 0.8,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  widget.productItem.photos!.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: selectedIndex == index
                                ? const Color(0xFFE67335)
                                : Colors.transparent,
                            width: 2,
                          )),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              '${widget.imgUrl}${widget.productItem.photos![index].url}',
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? Colors.white.withOpacity(0.5)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8)),
                            height: 80,
                            width: 80,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              widget.productItem.name!,
              style: TextStyle(
                  fontSize: 24 * textScaleFactor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      color: (widget.productItem.isAvailable ?? true)
                          ? Colors.green
                          : Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      (widget.productItem.isAvailable ?? false)
                          ? 'Available'
                          : 'Unavaialable',
                      style: TextStyle(
                          color: (widget.productItem.isAvailable ?? false)
                              ? AppColors.green
                              : AppColors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const CustomAddRemoveButton(
                  quantity: '0',
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Description',
              style: TextStyle(
                  fontSize: 18 * textScaleFactor, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            SizedBox(
                height: screenHeight * .14,
                width: double.infinity,
                child: Text(
                  widget.productItem.description ?? '',
                  maxLines: 6,
                  style: TextStyle(
                      fontSize: 16 * textScaleFactor,
                      overflow: TextOverflow.clip),
                )),
            const SizedBox(height: 10),
            Text(
              '₦${widget.productItem.currentPrice![0].ngn!.first}',
              style: TextStyle(
                  fontSize: 24 * textScaleFactor, fontWeight: FontWeight.bold),
            ),
            Text(
              '${widget.productItem.availableQuantity} items left',
              style: TextStyle(
                  fontSize: 16 * textScaleFactor, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  textColor: AppColors.black,
                  color: AppColors.cardBgColor,
                  textSize: 18,
                  width: screenWidth * 0.4,
                  height: screenHeight * .06,
                  title: 'Place Order',
                  onPress: () {},
                ),
                ActionButton(
                  width: screenWidth * 0.4,
                  height: screenHeight * .06,
                  title: 'Add to Cart',
                  textSize: 18,
                  onPress: () {},
                )
              ],
            ),
            const SizedBox(height: 25)
          ],
        ),
      ),
    );
  }
}
