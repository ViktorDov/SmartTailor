import 'package:flutter/material.dart';
import 'package:smart_tailor/presentation/constants/app_colors.dart';

class TextFiledInputDecorations {
  final String hintText;

  const TextFiledInputDecorations({required this.hintText});

  InputDecoration get inputDecoration {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      filled: true,
      fillColor: AppColors.backgroundColor,
      labelStyle: TextStyle(color: AppColors.textSecondary),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textSecondary),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
