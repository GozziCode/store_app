import 'package:flutter/material.dart';

import 'package:store_app/constant/constant.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
      toolbarHeight: 180,
      leadingWidth: double.infinity,
      leading: Padding(
        padding: const EdgeInsets.only(top: 40, right: 25, left: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 54,
              width: 54,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/img4.jpg",
                    ),
                    fit: BoxFit.cover,
                    alignment: Alignment.center),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            const Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Chioma",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.black),
                ),
                SizedBox(height: 5),
                Text("Find and get your best cakes",
                    style: TextStyle(fontSize: 16, color: AppColors.black))
              ],
            )
          ],
        ),
      ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(15.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 15, top: 18, right: 15),
                    height: 50,
                    decoration: BoxDecoration(
                        color: AppColors.cardBgColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      enableSuggestions: true,
                      enableIMEPersonalizedLearning: true,
                      enableInteractiveSelection: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Search for your desired product',
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: AppColors.primaryColor, shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_list_sharp,
                        color: AppColors.white,
                      )),
                )
              ],
            ),
          )),
      elevation: 0,
      backgroundColor: AppColors.bgColor,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: IconButton(
              onPressed: () async {},
              icon: const Icon(
                Icons.notifications,
                color: AppColors.primaryColor,
                size: 30,
              )),
        )
      ]);
}
