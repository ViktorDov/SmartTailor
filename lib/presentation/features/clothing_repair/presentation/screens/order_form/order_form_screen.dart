import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tailor/presentation/constants/app_colors.dart';
import 'package:smart_tailor/presentation/features/clothing_repair/presentation/cubit/order_cubit.dart';
import 'package:smart_tailor/presentation/features/clothing_repair/presentation/screens/order_type/order_type_screen.dart';
import '../../../../../../domain/entity/order_type_card.dart';
import '../../../../../constants/app_decoration.dart';
import '../../../../../widgets/appbar.dart';

class OrderFormScreen extends StatefulWidget {
  final List<OrderTypeCard> orderTypes;
  static const String path = '/order_form';
  static const String name = 'orderForm';
  const OrderFormScreen({super.key, required this.orderTypes});

  @override
  State<OrderFormScreen> createState() => _OrderFormScreenState();
}

class _OrderFormScreenState extends State<OrderFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Замовлення',
        onPressed: () => context.goNamed(OrderTypeScreen.name),
      ),
      body: BlocProvider(
        create: (context) => CreateOrderCubit(widget.orderTypes),
        child: const OrderFormBody(),
      ),
    );
  }
}

class OrderFormBody extends StatelessWidget {
  const OrderFormBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ConsumerDataFormWidget(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class ConsumerDataFormWidget extends StatelessWidget {
  const ConsumerDataFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: NameTextField(),
              ),
              SizedBox(width: 20),
              Expanded(child: MiddleNameTextField()),
            ],
          ),
          SizedBox(height: 10),
          PhoneTextField(),
          SizedBox(height: 10),
          PriceTextField(),
          SizedBox(height: 10),
          DatePickerFormWidget(),
        ],
      ),
    );
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => context.read<CreateOrderCubit>().nameChanged(value),
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: const TextFiledInputDecorations(
        lableText: 'Ім\'я',
      ).inputDecoration,
    );
  }
}

class MiddleNameTextField extends StatelessWidget {
  const MiddleNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) =>
          context.read<CreateOrderCubit>().middleNameChanged(value),
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: const TextFiledInputDecorations(
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
        context.read<CreateOrderCubit>().phoneChanged(value.compareTo(value));
      },
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: const TextFiledInputDecorations(
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
          context.read<CreateOrderCubit>().priceChanged(value.compareTo(value)),
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: const TextFiledInputDecorations(
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
    final state = context.read<CreateOrderCubit>();
    return GestureDetector(
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2025),
          lastDate: DateTime(2050),
        );

        if (pickedDate != null) {
          state.setDeadline(pickedDate);
        }
      },
      child: BlocBuilder<CreateOrderCubit, CreateOrderState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              border: Border.all(color: AppColors.textPrimary),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: Text(
              '${state.deadline.month}/${state.deadline.day}/${state.deadline.year}',
            ),
          );
        },
      ),
    );
  }
}
