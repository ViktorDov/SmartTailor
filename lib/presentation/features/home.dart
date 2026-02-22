import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tailor/presentation/features/clothing_repair/presentation/screens/order_type/order_type_screen.dart';

import '../widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  static const String path = '/';
  static const String name = 'homeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const HomeScreenBody();
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Tailor'),
        centerTitle: true,
      ),
      body: const Center(
        child: HomeButtonFormWidget(),
      ),
    );
  }
}

class HomeButtonFormWidget extends StatelessWidget {
  const HomeButtonFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 30,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButtonWidget(
          onPressed: () {
            context.goNamed(OrderTypeScreen.name);
          },
          text: 'Створити замовлення',
        ),
        CustomButtonWidget(
          onPressed: () {
            // todo navigation
          },
          text: 'Видати замовлення',
        ),
        CustomButtonWidget(
          onPressed: () {
            // todo navigation
          },
          text: 'Актуальні замовлення',
        ),
        CustomButtonWidget(
          onPressed: () {
            // todo navigation
          },
          text: 'Налаштування',
        ),
      ],
    );
  }
}
