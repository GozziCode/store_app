import 'package:flutter/material.dart';
import 'package:store_app/constant/constant.dart';
import 'package:store_app/views/detail_screen.dart';

import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Item product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final List<CurrentPrice>? priceList = product.currentPrice;
    final String imgUrl = AppUrl.imgUrl;
    final double textScaleFactor = MediaQuery.textScalerOf(context).scale(1.5);

    return LayoutBuilder(builder: (context, constraints) {
      final double cardHeight = constraints.maxHeight * 0.7;
      final double imageHeight = cardHeight * 0.7;
      final double fontSize = 12 * textScaleFactor;
      final double priceFontSize = 12 * textScaleFactor;
      final double buttonSize = 25 * textScaleFactor;
      return Container(
          padding: const EdgeInsets.only(top: 5),
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.cardBgColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          productItem: product,
                          imgUrl: imgUrl,
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: SizedBox(
                      height: imageHeight,
                      width: double.infinity,
                      child: product.photos!.isEmpty
                          ? Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.bgColor,
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/img1.png",
                                      ),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.center)))
                          : ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(15),
                                  right: Radius.circular(15)),
                              child: Image.network(
                                '$imgUrl${product.photos![0].url}',
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  product.name!,
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: fontSize),
                ),
                SizedBox(
                  height: cardHeight * 0.03,
                ),
                Text(
                  priceList![0].ngn!.isEmpty
                      ? '₦0'
                      : '₦${priceList[0].ngn!.first}',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: priceFontSize,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: cardHeight * .010),
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      width: double.infinity,
                      height: buttonSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                              color: Colors.white, fontSize: fontSize),
                        ),
                      )),
                ),
              ],
            ),
          ));
    });
  }
}
