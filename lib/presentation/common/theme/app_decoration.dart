import 'package:flutter/material.dart';
import 'package:smart_tailor/presentation/common/theme/app_colors.dart';

class TextFiledInputDecorations {
  final String? errorText;
  final String hintText;

  const TextFiledInputDecorations({
    required this.hintText,
    this.errorText,
  });

  InputDecoration get inputDecoration {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.backgroundColor,
      hintText: hintText,
      errorText: errorText,
      hintStyle: const TextStyle(color: AppColors.textSecondary),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textSecondary),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepOrange),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
