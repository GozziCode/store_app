import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constant/constant.dart';

import 'package:store_app/widget/appbar.dart';
import 'package:store_app/widget/product_card.dart';

import '../provider/product_provider.dart';
import '../widget/error_widget.dart';
import '../widget/loading_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: homeAppBar(context),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.isLoading) {
            return const Center(
              child: LoadingHome(),
            );
          }
          if (productProvider.errorMessage != null) {
            return ErrowWidget(provider: productProvider);
          }
          if (productProvider.productModel?.items?.isEmpty ?? true) {
            return RefreshIndicator(
              onRefresh: () => productProvider.fetchProducts(),
              child: ListView(
                children: const [
                  Center(
                    child: Text(
                        'No product has been added yet. Pull to refresh page'),
                  ),
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: RefreshIndicator(
              onRefresh: () => productProvider.fetchProducts(),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 0.2,
                  childAspectRatio: 0.7,
                ),
                itemCount: productProvider.productModel!.items!.length,
                itemBuilder: (_, index) => ProductCard(
                  product: productProvider.productModel!.items![index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
