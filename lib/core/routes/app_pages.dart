import 'package:get/get.dart';
import 'package:ivent_trial/core/routes/app_routes.dart';
import 'package:ivent_trial/view/authentication/otp_verification/view/otp_verification_view.dart';
import 'package:ivent_trial/view/authentication/phone_verification/view/phone_verification_view.dart';
import 'package:ivent_trial/view/dashboard/dashboard_view.dart';

class AppPages {
  AppPages._();

  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.phoneVerification,
      page: () => const PhoneVerificationView(),
    ),
    GetPage(
      name: AppRoutes.otpVerification,
      page: () => const OtpVerificationView(),
    ),
    GetPage(name: AppRoutes.dashboard, page: () => const DashboardView()),
  ];
}
