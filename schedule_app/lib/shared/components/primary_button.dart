import 'package:flutter/material.dart';
import 'package:schedule_app/shared/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const PrimaryButton({Key? key, required this.onPressed, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(label),
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(45))),
        backgroundColor: MaterialStateProperty.all(AppColors.deepPurple),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 8, horizontal: 64)),
        textStyle: MaterialStateProperty.all(
          Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
