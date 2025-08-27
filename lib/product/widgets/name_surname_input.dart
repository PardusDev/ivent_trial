import 'package:flutter/material.dart';
import 'package:ivent_trial/core/constants/app_text_styles.dart';
import 'package:ivent_trial/core/constants/app_colors.dart';

class NameSurnameInput extends StatefulWidget {
  const NameSurnameInput({required this.controller, this.onChanged, super.key});

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  @override
  State<NameSurnameInput> createState() => _NameSurnameInputState();
}

class _NameSurnameInputState extends State<NameSurnameInput> {
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
    _hasText = widget.controller.text.isNotEmpty;
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    final original = widget.controller.text;
    // Title-case each word: first letter upper, rest lower (basic TR-agnostic)
    final titleCased = original
        .split(RegExp(r'\s+'))
        .map(
          (w) => w.isEmpty
              ? w
              : (w.substring(0, 1).toUpperCase() +
                    (w.length > 1 ? w.substring(1).toLowerCase() : '')),
        )
        .join(' ');

    if (titleCased != original) {
      widget.controller.value = TextEditingValue(
        text: titleCased,
        selection: TextSelection.collapsed(offset: titleCased.length),
      );
    }

    final has = widget.controller.text.isNotEmpty;
    if (has != _hasText) {
      setState(() => _hasText = has);
    }
    widget.onChanged?.call(widget.controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.done,
      textCapitalization: TextCapitalization.words,
      style: AppTextStyles.bold24.copyWith(
        color: _hasText ? AppColors.veryDarkGrey : AppColors.grey500,
      ),
      decoration: InputDecoration(
        hintText: 'Adınız Soyadınız',
        hintStyle: AppTextStyles.bold24.copyWith(color: AppColors.grey500),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.zero,
      ),
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
    );
  }
}
