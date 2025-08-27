import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent_trial/view/authentication/phone_verification/view/phone_verification_view.dart';

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
      home: const PhoneVerificationView(),
      getPages: [
        GetPage(
          name: '/phone-verification',
          page: () => const PhoneVerificationView(),
        ),
      ],
    );
  }
}
