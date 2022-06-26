import 'package:flutter/material.dart';
import 'package:schedule_app/shared/theme/app_colors.dart';

class TexButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const TexButton({Key? key, required this.onPressed, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return AppColors.deepPurple.withOpacity(0.04);
            }

            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed)) {
              return AppColors.deepPurple.withOpacity(0.12);
            }

            return null;
          },
        ),
      ),
      onPressed: onPressed,
      child: Text(label, style: Theme.of(context).textTheme.bodyText1),
    );
  }
}
