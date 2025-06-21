import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_project/core/utils/extensions/context_extensions.dart';

class LoggingWidget extends StatelessWidget {
  final Color progressIndicatorColor;
  final Color textColor;
  final Color backGroundColor;
  final String loggingMessage;
  const LoggingWidget({
    super.key,
    required this.loggingMessage,
    required this.backGroundColor,
    required this.textColor,
    required this.progressIndicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight,
      width: context.screenWidth,
      color: backGroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            loggingMessage,
            style: TextStyle(color: textColor, fontSize: 20.sp),
          ),
          SizedBox(height: 28.h),
          CircularProgressIndicator(color: progressIndicatorColor),
        ],
      ),
    );
  }
}
