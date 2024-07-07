import 'package:flutter/material.dart';
import 'package:store_app/constant/constant.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_product_services.dart';
import 'package:store_app/widget/appbar.dart';
import 'package:store_app/widget/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ProductModel> _loadedProducts;
  @override
  void initState() {
    _loadedProducts = GetProductServices().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: homeAppBar(context),
      body: FutureBuilder(
        future: _loadedProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Please check your network conncetion and try again'),
            );
          }
          if (snapshot.data!.items!.isEmpty) {
            return const Center(
              child: Text('No product has been added please check back later'),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: RefreshIndicator(
              onRefresh: ()=>GetProductServices().getProducts(),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 0.2,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: snapshot.data!.items!.length,
                  itemBuilder: (_, index) => ProductCard(
                        product: snapshot.data!.items![index],
                      )),
            ),
          );
        },
      ),
    );
  }
}
