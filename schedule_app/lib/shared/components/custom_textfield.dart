import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:schedule_app/shared/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? errorText;
  final String? hintText;
  final Icon? icon;
  final bool readOnly;
  final int? maxLenght;
  final VoidCallback? onTap;
  final String? mask;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  const CustomTextField(
      {Key? key,
      required this.label,
      this.errorText,
      this.hintText,
      this.icon,
      this.onTap,
      this.controller,
      this.onChanged,
      this.maxLenght,
      this.keyboardType,
      this.mask,
      this.readOnly = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: TextField(
          inputFormatters:
              mask != null ? [MaskTextInputFormatter(mask: mask)] : null,
          keyboardType: keyboardType,
          maxLength: maxLenght,
          maxLines: null,
          readOnly: readOnly,
          controller: controller,
          onTap: onTap,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: icon,
            prefixIconConstraints:
                const BoxConstraints(maxWidth: 32, minWidth: 28),
            labelText: label,
            errorText: errorText,
            hintText: hintText,
            labelStyle: const TextStyle(color: AppColors.deepPurple),
            hintStyle: const TextStyle(color: AppColors.neutralColorHightDark),
            border: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.deepPurple,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.greyMedium,
              ),
            ),
            errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
              color: AppColors.errorColor,
            )),
          ),
        ));
  }
}
