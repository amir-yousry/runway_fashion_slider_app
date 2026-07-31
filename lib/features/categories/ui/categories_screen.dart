import 'package:flutter/material.dart';
import 'package:runway_fashion_slider_app/core/widgets/custom_appbar.dart';
import 'package:runway_fashion_slider_app/features/categories/data/products.dart';
import 'package:runway_fashion_slider_app/features/categories/ui/widgets/categories_filter_widget.dart';
import 'package:runway_fashion_slider_app/features/categories/ui/widgets/product_item.dart';
import 'package:runway_fashion_slider_app/features/product_details/ui/product_details_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Men',
        prefix: 'assets/svgs/arrow-left.svg',
        suffix: 'assets/svgs/cart.svg',
      ),
      body: Column(
        children: [
          const CategoriesFilterWidget(),
          const SizedBox(height: 13),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  childAspectRatio: 1 / 1.8,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductItemWidget(
                    name: product.name,
                    price: product.price,
                    image: product.image,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) => ProductDetailsScreen(
                          image: product.image,
                          name: product.name,
                          price: product.price,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
