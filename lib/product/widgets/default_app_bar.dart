import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent_trial/core/constants/app_colors.dart';
import 'package:ivent_trial/core/enums/app_icons.dart';
import 'package:ivent_trial/core/enums/app_images.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    this.showBackButton = true,
    this.onBackPressed,
    super.key,
  });

  final bool showBackButton;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: showBackButton
          ? IconButton(
              onPressed: onBackPressed ?? () => Get.back(),
              icon: AppIcons.chevronLeft.toSvg(
                size: 24,
                color: AppColors.veryDarkGrey,
              ),
            )
          : null,
      title: AppImages.iventHeader.toImage(height: 52),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
