import 'package:flutter/material.dart';
import 'package:runway_fashion_slider_app/core/widgets/categories_filter_widget.dart';
import 'package:runway_fashion_slider_app/core/widgets/custom_appbar.dart';
import 'package:runway_fashion_slider_app/features/lobby/ui/widgets/bottom_sheet_widget.dart';

class LobbyScreen extends StatefulWidget {
  final String image;
  final String name;
  final String price;

  const LobbyScreen({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  State<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomSheet();
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.17,
          minChildSize: 0.17,
          maxChildSize: 0.8,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return BottomSheetWidget(
              scroll: scrollController,
              name: widget.name,
              price: widget.price,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Men",
        prefix: "assets/svgs/arrow-left.svg",
        suffix: "assets/svgs/cart.svg",
        onTap: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            CategoryFilterWidget(),
            SizedBox(height: 13),
            Stack(
              children: [
                SizedBox(
                  width: 250,
                  height: 600,
                  child: Image.asset(widget.image),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  left: 10,
                  child: Image.asset("assets/images/shadow.png".toString()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
