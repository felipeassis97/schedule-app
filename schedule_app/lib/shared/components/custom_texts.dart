import 'package:flutter/material.dart';
import 'package:schedule_app/shared/theme/app_colors.dart';

abstract class CustomTexts {
  static Text smallText(String text,
          {textAlign = TextAlign.left,
          fontWeight = FontWeight.w500,
          double fontSize = 10,
          int maxLines = 1,
          color = AppColors.neutralColorLowPure}) =>
      Text(text,
          maxLines: maxLines,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color,
            overflow: TextOverflow.ellipsis,
          ));

  static Text mediumText(String text,
          {textAlign = TextAlign.left,
          fontWeight = FontWeight.w500,
          double fontSize = 12,
          int maxLines = 1,
          color = AppColors.neutralColorLowPure}) =>
      Text(text,
          maxLines: maxLines,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color,
            overflow: TextOverflow.ellipsis,
          ));

  static Text bigText(String text,
          {textAlign = TextAlign.left,
          fontWeight = FontWeight.w600,
          double fontSize = 14,
          int maxLines = 1,
          color = AppColors.neutralColorLowPure}) =>
      Text(text,
          maxLines: maxLines,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color,
            overflow: TextOverflow.ellipsis,
          ));
}
