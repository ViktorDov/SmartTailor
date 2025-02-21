import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
        foregroundColor: WidgetStateProperty.all(AppColors.appBarTextColor),
        minimumSize: WidgetStateProperty.all(const Size(340, 65)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
