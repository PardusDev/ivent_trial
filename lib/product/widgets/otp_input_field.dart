import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ivent_trial/core/constants/app_colors.dart';
import 'package:ivent_trial/core/constants/app_text_styles.dart';

class OtpInputField extends StatefulWidget {
  const OtpInputField({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onBackspace,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final VoidCallback onBackspace;

  @override
  State<OtpInputField> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<OtpInputField> {
  bool _hasFocus = false;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChanged);
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChanged);
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onFocusChanged() {
    setState(() {
      _hasFocus = widget.focusNode.hasFocus;
    });
  }

  void _onTextChanged() {
    setState(() {
      _hasText = widget.controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: _hasFocus
            ? AppColors.primary.withValues(alpha: 0.08)
            : AppColors.grey100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          maxLength: 1,
          style: AppTextStyles.medium16.copyWith(
            color: _hasText ? AppColors.veryDarkGrey : AppColors.grey500,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          decoration: const InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            counterText: '',
            contentPadding: EdgeInsets.zero,
            isDense: true,
          ),
          onChanged: (value) {
            widget.onChanged(value);
          },
          onTap: () {
            // Select all text when tapped for easier editing
            widget.controller.selection = TextSelection(
              baseOffset: 0,
              extentOffset: widget.controller.text.length,
            );
          },
          onEditingComplete: () {
            // Handle when editing is complete
          },
        ),
      ),
    );
  }
}
