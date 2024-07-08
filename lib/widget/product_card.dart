import 'package:flutter/material.dart';
import 'package:store_app/constant/constant.dart';
import 'package:store_app/screens/detail_screen.dart';

import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Item product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final List<CurrentPrice>? priceList = product.currentPrice;
    final String imgUrl = AppUrl.imgUrl;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailScreen(
            productItem: product,
            imgUrl: imgUrl,
          ),
        ),
      ),
      child: Container(
          height: 400,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 120,
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
                        : Image.network(
                            '$imgUrl${product.photos![0].url}',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Text(
                    product.name!,
                    style: const TextStyle(
                        overflow: TextOverflow.fade,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      priceList![0].ngn!.isEmpty
                          ? '0'
                          : '₦${priceList[0].ngn!.first}',
                      style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 40,
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 2,
                )
              ],
            ),
          )),
    );
  }
}
