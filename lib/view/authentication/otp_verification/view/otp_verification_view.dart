import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent_trial/core/constants/app_colors.dart';
import 'package:ivent_trial/core/constants/app_text_styles.dart';
import 'package:ivent_trial/product/widgets/default_app_bar.dart';
import 'package:ivent_trial/product/widgets/otp_input_field.dart';
import 'package:ivent_trial/product/widgets/continue_button.dart';
import '../controller/otp_verification_controller.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OtpVerificationController());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const DefaultAppBar(showBackButton: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Stack(
            children: [
              Column(
                children: [
                  const Spacer(flex: 2),
                  _OtpVerificationContent(controller: controller),
                  const Spacer(flex: 3),
                  _BottomResendSection(controller: controller),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Private widgets for modular structure

class _OtpVerificationContent extends StatelessWidget {
  const _OtpVerificationContent({required this.controller});

  final OtpVerificationController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const _HeaderText(),
        const SizedBox(height: 32),
        _OtpInputSection(controller: controller),
      ],
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText();

  @override
  Widget build(BuildContext context) {
    return Text(
      'İletişim numarana gönderdiğimiz kodu aşağıya girebilirsin.',
      style: AppTextStyles.bold24Primary,
      textAlign: TextAlign.center,
      overflow: TextOverflow.visible,
    );
  }
}

class _OtpInputSection extends StatelessWidget {
  const _OtpInputSection({required this.controller});

  final OtpVerificationController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        6,
        (index) => OtpInputField(
          controller: controller.otpControllers[index],
          focusNode: controller.focusNodes[index],
          onChanged: (value) => controller.onOtpChanged(value, index),
          onBackspace: () => controller.onOtpBackspace(index),
        ),
      ),
    );
  }
}

class _BottomResendSection extends StatelessWidget {
  const _BottomResendSection({required this.controller});

  final OtpVerificationController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool enabled = controller.canResend;
      final String text = enabled
          ? 'Tekrar Gönder'
          : 'Tekrar Gönder (${controller.timerText})';
      return PrimaryButton(
        text: text,
        onPressed: enabled ? controller.resendOtp : null,
      );
    });
  }
}

// Continue button removed: auto-verify on 6 digits entered
