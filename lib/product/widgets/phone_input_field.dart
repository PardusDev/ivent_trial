import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ivent_trial/core/constants/app_colors.dart';
import 'package:ivent_trial/core/constants/app_text_styles.dart';
import 'package:ivent_trial/product/utils/phone_utils.dart';

class PhoneInputField extends StatefulWidget {
  const PhoneInputField({required this.controller, this.onChanged, super.key});

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  @override
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _hasText = widget.controller.text.isNotEmpty;
    });
    widget.onChanged?.call(widget.controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // +90 prefix
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '+90',
              style: AppTextStyles.bold24.copyWith(color: AppColors.grey500),
            ),
          ),
          // Spacing
          const SizedBox(width: 4),
          // Phone number input
          Flexible(
            child: SizedBox(
              width: 200,
              child: TextFormField(
                controller: widget.controller,
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.center,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                  PhoneNumberFormatter(),
                ],
                style: AppTextStyles.bold24.copyWith(
                  color: _hasText ? AppColors.veryDarkGrey : AppColors.grey500,
                ),
                decoration: InputDecoration(
                  hintText: 'XXXXXXXXXX',
                  hintStyle: AppTextStyles.bold24.copyWith(
                    color: AppColors.grey500,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                ),
                onTapOutside: (_) {
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
