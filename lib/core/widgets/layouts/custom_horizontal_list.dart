import 'package:flutter/material.dart';

class CustomHorizontalList extends StatelessWidget {
  final int itemCount;
  final double listHeight;
  final Widget item;
  final double aspectRatio;
  final double distanceBetweenItems;
  const CustomHorizontalList({
    super.key,
    required this.listHeight,
    required this.item,
    this.aspectRatio = 1,
    this.distanceBetweenItems = 16,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: listHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsets.all(distanceBetweenItems),
              child: AspectRatio(aspectRatio: aspectRatio, child: item),
            ),
        itemCount: itemCount,
      ),
    );
  }
}
