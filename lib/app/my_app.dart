import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_project/core/routes/router_generator.dart';
import 'package:template_project/core/utils/helper_functions.dart';
import 'package:template_project/core/utils/themes/app_themes.dart';

import '../core/utils/helper_functions.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final logicalWidth =
        WidgetsBinding
            .instance
            .platformDispatcher
            .views
            .first
            .physicalSize
            .width /
        WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
    return ScreenUtilInit(
      designSize: HelperFunctions.getDesignSize(logicalWidth),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: RouterGenerator.mainRouting, //variable you have created
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
        );
      },
    );
  }
}
