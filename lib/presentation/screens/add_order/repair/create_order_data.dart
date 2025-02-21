import 'package:flutter/material.dart';

import '../../../constants/app_decoration.dart';

class AddOrderScreenWidget extends StatefulWidget {
  static const String path = '/add_order';
  static const String name = 'addOrder';
  const AddOrderScreenWidget({super.key});

  @override
  State<AddOrderScreenWidget> createState() => _AddOrderScreenWidgetState();
}

class _AddOrderScreenWidgetState extends State<AddOrderScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Замовлення'),
        centerTitle: true,
      ),
      body: Center(
        child: ConsumerDataFormWidget(),
      ),
    );
  }
}

class ConsumerDataFormWidget extends StatelessWidget {
  const ConsumerDataFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        spacing: 10,
        children: [
          TextField(
            decoration: TextFiledInputDecorations(hintText: 'Номер телефону')
                .inputDecoration,
            keyboardType: TextInputType.number,
          ),
          Row(
            spacing: 20,
            children: [
              Expanded(
                child: TextField(
                  decoration: TextFiledInputDecorations(hintText: 'Ім\'я')
                      .inputDecoration,
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: TextFiledInputDecorations(hintText: 'По батькові')
                      .inputDecoration,
                ),
              ),
            ],
          ),
          TextField(
            decoration:
                TextFiledInputDecorations(hintText: 'Дедлайн').inputDecoration,
          ),
        ],
      ),
    );
  }
}
