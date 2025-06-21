import 'package:flutter/material.dart';

class CustomSliverGrid extends StatelessWidget {
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final int crossAxisCount;
  final int itemCount;
  final Widget item;
  const CustomSliverGrid({
    super.key,
    required this.item,
    required this.itemCount,
    this.crossAxisSpacing = 16,
    this.mainAxisSpacing = 16,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) => item,
    );
  }
}
