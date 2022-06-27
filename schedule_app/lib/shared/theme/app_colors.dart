import 'package:flutter/material.dart';

abstract class AppColors {
  static MaterialColor deepPurpleSwatch =
      const MaterialColor(0xFF7052CC, <int, Color>{
    50: Color(0xFFEEEAF9),
    100: Color(0xFFD4CBF0),
    200: Color(0xFFB8A9E6),
    300: Color(0xFF9B86DB),
    400: Color(0xFF856CD4),
    500: Color(0xFF7052CC),
    600: Color(0xFF684BC7),
    700: Color(0xFF5D41C0),
    800: Color(0xFF5338B9),
    900: Color(0xFF4128AD),
  });

  static const Color deepPurple = Color(0xFF7052CC);
  static const Color deepPurpleLight = Color(0xFFB8A9E6);
  static const Color deepPurpleDark = Color(0xFF5338B9);

  static const Color successColor = Color(0xFF0EB66F);
  static const Color errorColor = Color(0xFFD30014);
  static const Color blue = Color(0xFF4DDBFF);
  static const Color yellow = Color(0xFFCC9E14);

  static const Color feedbackColorHelperPure = Color(0xFFFF8A00);
  static const Color feedbackColorHelperLight = Color(0xFFFFE3C2);
  static const Color cancelReasonColor = Color(0xFFF3EEE8);
  static const Color feedbackColorHelperMedium = Color(0xFFCC6E00);
  static const Color feedbackColorHelperDark = Color(0xFF7A4200);

  static const Color neutralColorLowPure = Color(0xFF2E3033);
  static const Color neutralColorLowLight = Color(0xFF8A9199);
  static const Color neutralColorLowMedium = Color(0xFF5B6166);
  static const Color neutralColorLowDark = Color(0xFF132632);
  static const Color neutralColorHightPure = Color(0xFFFFFFFF);
  static const Color greyMedium = Color(0xFF797979);
  static const Color neutralColorHightMedium = Color(0xFFE0E0E0);
  static const Color neutralColorHightDark = Color(0xFFD9D9D9);
}
