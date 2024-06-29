import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutlumesaj/core/utils/extensions/context_extensions.dart';

class ThemeConstants {
  static TextStyle? medium(BuildContext context, Color textColor) {
    return context.textTheme.bodyMedium
        ?.copyWith(color: textColor, fontSize: 16, fontWeight: FontWeight.w600);
  }

  static TextStyle? large(BuildContext context) {
    return context.textTheme.bodyLarge
        ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold);
  }
}

double kRadius = 20.r;
double kHorizontalPadding = 24.w;
