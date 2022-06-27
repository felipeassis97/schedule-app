import 'package:flutter/material.dart';
import 'package:schedule_app/shared/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? errorText;
  final String? hintText;
  const CustomTextField(
      {Key? key, required this.label, this.errorText, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: TextField(
          decoration: InputDecoration(
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
