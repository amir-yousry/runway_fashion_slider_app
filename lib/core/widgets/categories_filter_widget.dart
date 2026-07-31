import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryFilterWidget extends StatelessWidget {
  const CategoryFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: [
            const Text(
              "Sort by",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset("assets/svgs/select.svg"),
            const Spacer(),
            SvgPicture.asset("assets/svgs/filter.svg"),
            const SizedBox(width: 10),
            const Text(
              "Filter",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 20),
            SvgPicture.asset("assets/svgs/grid.svg"),
            const SizedBox(width: 20),
            SvgPicture.asset("assets/svgs/groups.svg"),
          ],
        ),
      ),
    );
  }
}
