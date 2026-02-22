import 'package:flutter/material.dart';
import 'package:smart_tailor/presentation/features/clothing_repair/presentation/theme/app_theme.dart';

import 'navigation/navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: Navigation.router,
    );
  }
}
