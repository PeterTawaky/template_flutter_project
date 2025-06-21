import 'package:flutter/material.dart';

import 'package:template_project/app/my_app.dart';
import 'package:template_project/core/dependencies/service_locator.dart';
import 'package:template_project/core/errors/error_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpEnvironment();
  runApp(const MyApp());
}

void setUpEnvironment() {
  ErrorWidget.builder =
      (FlutterErrorDetails details) => ErrorView(errorDetails: details);
  setupServiceLocator();
}
