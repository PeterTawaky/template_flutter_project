import 'package:flutter/material.dart';

Widget bottomEllipse({required num width}) {
  return Container(
    width: width * 0.35,
    height: 5,
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: Colors.grey[400],
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
