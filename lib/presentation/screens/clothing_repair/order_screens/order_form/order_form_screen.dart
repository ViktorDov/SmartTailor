import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tailor/presentation/constants/app_colors.dart';
import 'package:smart_tailor/presentation/screens/clothing_repair/cubit/repair_cubit.dart';
import '../../../../constants/app_decoration.dart';

class OrderFormScreen extends StatefulWidget {
  static const String path = '/order_form';
  static const String name = 'orderForm';
  const OrderFormScreen({super.key});

  @override
  State<OrderFormScreen> createState() => _OrderFormScreenState();
}

class _OrderFormScreenState extends State<OrderFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Замовлення'), centerTitle: true),
      body: OrderFormBody(),
    );
  }
}

class OrderFormBody extends StatelessWidget {
  const OrderFormBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ConsumerDataFormWidget(), const SizedBox(height: 10)],
        ),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: const [
              Expanded(child: NameTextField()),
              SizedBox(width: 20),
              Expanded(child: MiddleNameTextField()),
            ],
          ),
          const SizedBox(height: 10),
          const PhoneTextField(),
          const SizedBox(height: 10),
          const PriceTextField(),
          const SizedBox(height: 10),
          const DatePickerFormWidget(),
        ],
      ),
    );
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => context.read<RepairCubit>().nameChanged(value),
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: TextFiledInputDecorations(lableText: 'Ім\'я').inputDecoration,
    );
  }
}

class MiddleNameTextField extends StatelessWidget {
  const MiddleNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) =>
          context.read<RepairCubit>().middleNameChanged(value),
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: TextFiledInputDecorations(
        lableText: 'По батькові',
      ).inputDecoration,
    );
  }
}

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<RepairCubit>().phoneChanged(value.compareTo(value));
      },
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: TextFiledInputDecorations(
        lableText: 'Номер телефону',
      ).inputDecoration,
      keyboardType: TextInputType.number,
    );
  }
}

class PriceTextField extends StatelessWidget {
  const PriceTextField({super.key});
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) =>
          context.read<RepairCubit>().priceChanged(value.compareTo(value)),
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: TextFiledInputDecorations(
        lableText: 'Ціна замовлення',
      ).inputDecoration,
      keyboardType: TextInputType.number,
    );
  }
}

class DatePickerFormWidget extends StatelessWidget {
  const DatePickerFormWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2025),
          lastDate: DateTime(2050),
        );

        if (pickedDate != null) {
          print('Date: ${pickedDate.toString()}');
        }
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          border: Border.all(color: AppColors.textPrimary),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Text('01/01/2025'),
      ),
    );
  }
}
