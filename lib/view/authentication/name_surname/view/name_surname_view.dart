import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent_trial/core/constants/app_colors.dart';
import 'package:ivent_trial/core/constants/app_text_styles.dart';
import 'package:ivent_trial/product/widgets/default_app_bar.dart';
import 'package:ivent_trial/product/widgets/continue_button.dart';
import 'package:ivent_trial/product/widgets/name_surname_input.dart';
import '../controller/name_surname_controller.dart';

class NameSurnameView extends StatelessWidget {
  const NameSurnameView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NameSurnameController());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const DefaultAppBar(showBackButton: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(flex: 2),
              _Content(controller: controller),
              const Spacer(flex: 3),
              _BottomButton(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.controller});
  final NameSurnameController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Etkinliklere göz atmadan önce tanışalım.',
          style: AppTextStyles.bold24Primary,
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
        ),
        const SizedBox(height: 24),
        _SingleField(controller: controller),
      ],
    );
  }
}

class _SingleField extends StatelessWidget {
  const _SingleField({required this.controller});
  final NameSurnameController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 56,
      alignment: Alignment.centerLeft,
      child: NameSurnameInput(controller: controller.nameController),
    );
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton({required this.controller});
  final NameSurnameController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        text: 'Devam Et',
        onPressed: controller.canContinueRx.value
            ? controller.continueNext
            : null,
      ),
    );
  }
}
