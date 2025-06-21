import 'package:flutter/material.dart';

class CustomSliverList extends StatelessWidget {
  final Widget item;
  final int itemCount;
  final double mainAxisSpacing;
  const CustomSliverList({
    super.key,
    required this.item,
    required this.itemCount,
    required this.mainAxisSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: itemCount,
      itemBuilder:
          (context, index) => Padding(
            padding: EdgeInsetsDirectional.only(top: mainAxisSpacing),
            child: item,
          ),
    );
  }
}
