import 'package:flutter/material.dart';
import 'package:smart_tailor/presentation/constants/app_colors.dart';
// import 'package:google_fonts/google_fonts.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback onPressed;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  const CustomAppBarWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.centerTitle = true,
    this.actions,
    this.leading,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: .w600),
      ),
      centerTitle: centerTitle,
      actions: actions,
      backgroundColor: Colors.white,
      foregroundColor: AppColors.appBarColor,
      animateColor: true,
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(10, 9, 9, 9),
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2.3,
              color: AppColors.appBarColor,
            ),
          ),
          child: IconButton(
            iconSize: 22,
            color: AppColors.appBarColor,
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_back,
              fill: 1,
            ),
          ),
        ),
      ),
    );
  }
}
