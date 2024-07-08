import 'package:flutter/material.dart';
import 'package:store_app/constant/constant.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                '${widget.imgUrl}${widget.productItem.photos![selectedIndex].url}',
                height: 250,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
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
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 25,
                  width: 60,
                  decoration: BoxDecoration(
                      color: (widget.productItem.isAvailable ?? false)
                          ? Colors.green
                          : Colors.red,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    (widget.productItem.isAvailable ?? false)
                        ? 'Available'
                        : 'Unavaialable',
                    style: TextStyle(
                      color: (widget.productItem.isAvailable ?? false)
                          ? const Color(0xFF2B812E)
                          : const Color(0xFF931F17),
                    ),
                  ),
                ),
                const CustomAddRemoveButton(
                  quantity: '0',
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            SizedBox(
                height: 100,
                width: double.infinity,
                child: Text(widget.productItem.description ?? '')),
            const SizedBox(height: 15),
            Text(
              widget.productItem.currentPrice![0].ngn!.first,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Row(children: [
              
            ],)
          ],
        ),
      ),
    );
  }
}
