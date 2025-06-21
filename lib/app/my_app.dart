import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_project/core/routes/router_generator.dart';
import 'package:template_project/core/utils/themes/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        360,
        690,
      ), //the size of screen that designer work on it on figma
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
