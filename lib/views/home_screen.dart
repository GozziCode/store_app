import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constant/constant.dart';

import 'package:store_app/widget/home_appbar.dart';
import 'package:store_app/widget/product_card.dart';

import '../provider/product_provider.dart';
import '../widget/error_widget.dart';
import '../widget/loading_home.dart';
import '../widget/no_product_view.dart';

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
            return NoProduct(
              onPress: () => productProvider.fetchProducts(),
            );
          }
          return LayoutBuilder(builder: (context, constraints) {
            const double crossAxisSpacing = 10.0;
            const double mainAxisSpacing = 10.0;
            const double aspectRatio = 0.7;
            final crossAxisCount = (constraints.maxWidth / 200).floor();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: RefreshIndicator(
                onRefresh: () => productProvider.fetchProducts(),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: crossAxisSpacing,
                    mainAxisSpacing: mainAxisSpacing,
                    childAspectRatio: aspectRatio,
                  ),
                  itemCount: productProvider.productModel!.items!.length,
                  itemBuilder: (_, index) => ProductCard(
                    product: productProvider.productModel!.items![index],
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
