import 'package:flutter/material.dart';
// import 'package:smart_tailor/presentation/constants/app_colors.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback onLeadingButtonPress;
  final List<Widget>? actions;
  final Widget? leading;
  const CustomAppBarWidget({
    super.key,
    required this.title,
    required this.onLeadingButtonPress,
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
      actions: actions,
      animateColor: true,
      leading: _BackButton(onPress: onLeadingButtonPress),
    );
  }
}

class _BackButton extends StatelessWidget {
  final VoidCallback onPress;
  const _BackButton({required this.onPress});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 9, 9, 9),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2.3,
            color: color,
          ),
        ),
        child: IconButton(
          iconSize: 22,
          onPressed: onPress,
          icon: Icon(
            color: color,
            Icons.arrow_back,
            fill: 1,
          ),
        ),
      ),
    );
  }
}
