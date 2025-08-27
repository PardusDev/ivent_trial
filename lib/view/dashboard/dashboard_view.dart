import 'package:flutter/material.dart';
import 'package:ivent_trial/core/constants/app_colors.dart';
import 'package:ivent_trial/core/constants/app_text_styles.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '🎉 Tebrikler!',
                style: AppTextStyles.bold32,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'OTP doğrulama başarılı!',
                style: AppTextStyles.bold24Primary,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Ana sayfa burada olacak...',
                style: AppTextStyles.medium16,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
