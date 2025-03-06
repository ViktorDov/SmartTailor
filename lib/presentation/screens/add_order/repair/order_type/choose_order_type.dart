import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../home.dart' show HomeScreen;

class OrderTypeScreen extends StatelessWidget {
  static const String path = '/choose_type';
  static const String name = 'chooseType';
  const OrderTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Тип замовлення',
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => context.goNamed(HomeScreen.name),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: CooseOrderTypeBody(),
    );
  }
}

class CooseOrderTypeBody extends StatelessWidget {
  final List<String> workTypes = [
    "Усунення дірки",
    "Вставити замочок",
    "Підрубити",
    "Вкоротити",
    "Кармани"
        "Вставити замочок",
    "Підрубити",
    "Вкоротити",
    "Кармани"
        "Вставити замочок",
    "Підрубити",
    "Вкоротити",
    "Кармани"
  ];

  CooseOrderTypeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: workTypes.length,
      itemBuilder: (context, inext) {
        String workType = workTypes[inext];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              workType,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        );
      },
    );
  }
}
