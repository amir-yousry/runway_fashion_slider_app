import 'package:flutter/material.dart';
import 'package:runway_fashion_slider_app/core/widgets/custom_appbar.dart';

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
    );
  }
}
