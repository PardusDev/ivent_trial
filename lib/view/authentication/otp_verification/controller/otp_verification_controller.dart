import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent_trial/product/snackbar/app_snackbar.dart';
import 'package:ivent_trial/product/utils/time_utils.dart';
import 'package:ivent_trial/core/routes/app_routes.dart';

class OtpVerificationController extends GetxController {
  // Text controllers for each OTP digit (6 digits)
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  // Focus nodes for each input field
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  // Observable variables
  final RxString otpCode = ''.obs;
  final RxBool canContinueRx = false.obs;
  final RxBool isLoadingRx = false.obs;
  final RxInt timerSeconds = 180.obs; // 3 minutes = 180 seconds
  final RxBool canResendRx = false.obs;
  Timer? _countdownTimer;

  @override
  void onInit() {
    super.onInit();

    // Add listeners to all OTP controllers
    for (int i = 0; i < otpControllers.length; i++) {
      otpControllers[i].addListener(() => _updateOtpCode());
    }

    // Start countdown timer
    _startCountdownTimer();
    _updateValidation();
  }

  @override
  void onClose() {
    // Dispose all controllers and focus nodes
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    _countdownTimer?.cancel();
    super.onClose();
  }

  void _updateOtpCode() {
    otpCode.value = otpControllers.map((controller) => controller.text).join();
    _updateValidation();
  }

  void _updateValidation() {
    canContinueRx.value = otpCode.value.length == 6;
  }

  // Handle OTP input and auto-focus management
  void onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      // Move to next field
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      // Move to previous field if current is empty
      focusNodes[index - 1].requestFocus();
    }

    _updateOtpCode();

    // Auto-verify when all 6 digits are filled
    if (otpCode.value.length == 6 && !isLoadingRx.value) {
      verifyOtp();
    }
  }

  // Handle backspace on empty field
  void onOtpBackspace(int index) {
    if (index > 0 && otpControllers[index].text.isEmpty) {
      // Move to previous field and clear it
      focusNodes[index - 1].requestFocus();
      otpControllers[index - 1].clear();
    }
  }

  // Verify OTP code
  Future<void> verifyOtp() async {
    if (!canContinueRx.value) return;

    isLoadingRx.value = true;

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Simulate verification logic
      if (otpCode.value == '123456') {
        // Navigate to next screen (dashboard)
        Get.offAllNamed(AppRoutes.nameSurname);

        AppSnackbar.showSuccess(
          'Başarılı',
          'Telefon numaranız doğrulandı',
          passAppBar: false,
        );
      } else {
        AppSnackbar.showErrorWithoutTitle(
          'Girdiğiniz kod numaranıza gönderilen kod ile eşleşmedi. Lütfen tekrar kontrol ediniz.',
        );

        // Clear OTP fields
        _clearOtpFields();
      }
    } catch (e) {
      AppSnackbar.showError('Hata', 'Doğrulama sırasında bir hata oluştu.');
    } finally {
      isLoadingRx.value = false;
    }
  }

  // Resend OTP code
  Future<void> resendOtp() async {
    if (!canResendRx.value) return;

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      AppSnackbar.showSuccess('Başarılı', 'Doğrulama kodu tekrar gönderildi');

      // Reset timer
      _startCountdownTimer();
      _clearOtpFields();
    } catch (e) {
      AppSnackbar.showError('Hata', 'Kod gönderilemedi. Tekrar deneyin.');
    }
  }

  void _clearOtpFields() {
    for (var controller in otpControllers) {
      controller.clear();
    }
    focusNodes[0].requestFocus();
    otpCode.value = '';
    _updateValidation();
  }

  void _startCountdownTimer() {
    _countdownTimer?.cancel();
    timerSeconds.value = 180; // 3 minutes
    canResendRx.value = false;

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerSeconds.value > 0) {
        timerSeconds.value--;
      } else {
        canResendRx.value = true;
        _countdownTimer?.cancel();
      }
    });
  }

  // Get timer text
  String get timerText =>
      TimeUtils.formatSecondsToMinutesSeconds(timerSeconds.value);

  // Check if continue button should be enabled
  bool get canContinue => canContinueRx.value && !isLoadingRx.value;
  bool get isLoading => isLoadingRx.value;
  bool get canResend => canResendRx.value;
}
