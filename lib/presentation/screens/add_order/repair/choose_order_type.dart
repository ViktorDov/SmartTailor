import 'package:flutter/material.dart';

class ChooseOrderTypeWidget extends StatelessWidget {
  static const String path = '/choose_type';
  static const String name = 'chooseType';
  const ChooseOrderTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CooseOrderTypeBody(),
    );
  }
}

class CooseOrderTypeBody extends StatelessWidget {
  const CooseOrderTypeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
