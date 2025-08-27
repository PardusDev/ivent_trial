import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent_trial/core/constants/app_colors.dart';
import 'package:ivent_trial/product/utils/phone_utils.dart';

class PhoneVerificationController extends GetxController {
  // Text controller
  final TextEditingController phoneController = TextEditingController();

  // Observable variables
  final RxString phoneNumber = ''.obs;
  final RxBool canContinueRx = false.obs;

  @override
  void onInit() {
    super.onInit();
    phoneController.addListener(_updatePhoneNumber);
    _updateValidation();
  }

  void _updatePhoneNumber() {
    phoneNumber.value = phoneController.text;
    _updateValidation();
  }

  void _updateValidation() {
    canContinueRx.value = PhoneUtils.isValidTurkishPhone(phoneController.text);
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  // Format phone number as user types
  void formatPhoneNumber(String value) {
    phoneController.value = PhoneUtils.formatPhoneNumber(
      value,
      phoneController.value,
    );
    // Manual update since programmatic changes don't trigger listener
    _updatePhoneNumber();
  }

  // Send phone number and navigate to OTP verification
  Future<void> sendPhoneNumber() async {
    if (!PhoneUtils.isValidTurkishPhone(phoneController.text)) return;

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      Get.snackbar(
        'Başarılı',
        'Doğrulama kodu gönderildi',
        backgroundColor: AppColors.primary,
        colorText: AppColors.white,
      );

      // Navigate to OTP verification screen
      Get.toNamed(
        '/otp-verification',
        arguments: {'phoneNumber': phoneNumber.value},
      );
    } catch (e) {
      Get.snackbar(
        'Hata',
        'Kod gönderilemedi. Tekrar deneyin.',
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
      );
    }
  }

  // Check if continue button should be enabled (Turkish phone validation)
  bool get canContinue => canContinueRx.value;
}
