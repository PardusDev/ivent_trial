import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent_trial/core/constants/app_colors.dart';
import 'package:ivent_trial/core/constants/app_text_styles.dart';
import 'package:ivent_trial/product/widgets/continue_button.dart';
import 'package:ivent_trial/product/widgets/default_app_bar.dart';
import 'package:ivent_trial/product/widgets/phone_input_field.dart';
import '../controller/phone_verification_controller.dart';

class PhoneVerificationView extends StatelessWidget {
  const PhoneVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhoneVerificationController());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const DefaultAppBar(showBackButton: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Spacer to push content to center
              const Spacer(flex: 2),

              // Main content
              _PhoneVerificationContent(controller: controller),

              // Spacer to balance the layout
              const Spacer(flex: 3),

              // Continue Button at bottom
              _ContinueButtonSection(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

// Private widgets for modular structure

class _PhoneVerificationContent extends StatelessWidget {
  const _PhoneVerificationContent({required this.controller});

  final PhoneVerificationController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const _HeaderText(),
        const SizedBox(height: 32),
        _PhoneInputSection(controller: controller),
      ],
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText();

  @override
  Widget build(BuildContext context) {
    return Text(
      'İletişim numaranı girerek seçkin etkinliklere katılabilirsin',
      style: AppTextStyles.bold24Primary,
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
    );
  }
}

class _PhoneInputSection extends StatelessWidget {
  const _PhoneInputSection({required this.controller});

  final PhoneVerificationController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PhoneInputField(
        controller: controller.phoneController,
        onChanged: controller.formatPhoneNumber,
      ),
    );
  }
}

class _ContinueButtonSection extends StatelessWidget {
  const _ContinueButtonSection({required this.controller});

  final PhoneVerificationController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        text: 'Devam Et',
        onPressed: controller.canContinueRx.value
            ? controller.sendPhoneNumber
            : null,
        isLoading: false,
      ),
    );
  }
}
