import 'package:flutter/material.dart';
import 'package:template_project/core/constants/app_colors.dart';

Widget bottomEllipse({required num width}) {
  return Container(
    width: width * 0.35,
    height: 5,
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: AppColors.bottomEllipseGrey,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
