import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent_trial/core/routes/app_routes.dart';
import 'package:ivent_trial/product/snackbar/app_snackbar.dart';

class NameSurnameController extends GetxController {
  final TextEditingController nameController = TextEditingController();

  final RxBool canContinueRx = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController.addListener(_validate);
    _validate();
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }

  void _validate() {
    final fullName = nameController.text.trim();
    final parts = fullName
        .split(RegExp(r'\s+'))
        .where((p) => p.isNotEmpty)
        .toList();
    final bool hasTwoWords =
        parts.length >= 2 && parts[0].length >= 2 && parts[1].length >= 2;
    canContinueRx.value = hasTwoWords;
  }

  Future<void> continueNext() async {
    if (!canContinueRx.value) return;
    try {
      await Future.delayed(const Duration(milliseconds: 400));
      AppSnackbar.showSuccess('Başarılı', 'Bilgilerin kaydedildi');
      Get.offAllNamed(AppRoutes.dashboard);
    } catch (e) {
      AppSnackbar.showError('Hata', 'Bir sorun oluştu, tekrar deneyin');
    }
  }
}
