import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent_trial/core/constants/app_colors.dart';
import 'package:ivent_trial/core/constants/app_text_styles.dart';

class AppSnackbar {
  AppSnackbar._();

  static void showSuccess(
    String title,
    String message, {
    bool passAppBar = true,
  }) {
    _show(
      title: title,
      message: message,
      backgroundColor: AppColors.primary,
      textColor: AppColors.white,
      hideTitle: false,
      passAppBar: passAppBar,
    );
  }

  static void showError(
    String title,
    String message, {
    bool passAppBar = true,
  }) {
    _show(
      title: title,
      message: message,
      backgroundColor: AppColors.grey300,
      textColor: AppColors.white,
      hideTitle: false,
      passAppBar: passAppBar,
    );
  }

  static void showErrorWithoutTitle(String message, {bool passAppBar = true}) {
    _show(
      title: '',
      message: message,
      backgroundColor: AppColors.grey300,
      textColor: AppColors.white,
      hideTitle: true,
      passAppBar: passAppBar,
    );
  }

  static void _show({
    required String title,
    required String message,
    required Color backgroundColor,
    required Color textColor,
    bool hideTitle = false,
    bool passAppBar = true,
  }) {
    final TextStyle messageStyle = AppTextStyles.medium14TextSecondary.copyWith(
      color: AppColors.white,
      overflow: TextOverflow.visible,
    );

    final Widget messageWidget = hideTitle
        ? Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 40),
              child: Text(
                message,
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: null,
                overflow: TextOverflow.visible,
                style: messageStyle,
              ),
            ),
          )
        : Text(
            message,
            textAlign: TextAlign.start,
            softWrap: true,
            maxLines: null,
            overflow: TextOverflow.visible,
            style: messageStyle,
          );

    Get.snackbar(
      hideTitle ? ' ' : title,
      ' ',
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.only(
        top: (passAppBar ? kToolbarHeight : 0) + 8,
        left: 16,
        right: 16,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      borderRadius: 12,
      backgroundColor: backgroundColor,
      colorText: textColor,
      titleText: hideTitle
          ? const SizedBox.shrink()
          : Text(title, style: AppTextStyles.medium16White),
      messageText: messageWidget,
      duration: Get.testMode
          ? Duration.zero
          : const Duration(milliseconds: 2500),
      isDismissible: true,
    );
  }
}
