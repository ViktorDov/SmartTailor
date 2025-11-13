import 'package:flutter/material.dart';
import 'package:smart_tailor/presentation/constants/app_colors.dart';

class TextFiledInputDecorations {
  final String lableText;

  const TextFiledInputDecorations({required this.lableText});

  InputDecoration get inputDecoration {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.backgroundColor,
      label: Text(lableText),
      labelStyle: const TextStyle(color: AppColors.textSecondary),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textSecondary),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
