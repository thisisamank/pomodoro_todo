import 'package:flutter/cupertino.dart';
import 'package:pomodoro_todo/constants/colors.dart';

class BrandTextStyles {
  static TextStyle heading1 = TextStyle(
    color: BrandColors.primaryText,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );
  static TextStyle body1 = TextStyle(
    color: BrandColors.secondaryText,
    fontSize: 14,
  );

  static TextStyle inputStyle = TextStyle(
    color: BrandColors.primaryText.withOpacity(.8),
    fontSize: 20,
  );
  static TextStyle inputStyleSecondary = TextStyle(
    color: BrandColors.primaryText.withOpacity(.6),
    fontSize: 16,
  );
}
