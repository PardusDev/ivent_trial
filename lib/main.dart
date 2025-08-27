import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent_trial/core/routes/app_pages.dart';
import 'package:ivent_trial/core/routes/app_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'iVent Trial',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.phoneVerification,
      getPages: AppPages.pages,
    );
  }
}
