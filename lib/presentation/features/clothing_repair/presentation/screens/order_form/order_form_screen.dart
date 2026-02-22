import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_tailor/presentation/common/extentions/date_time_extensions.dart';
import 'package:smart_tailor/presentation/features/clothing_repair/presentation/screens/order_confirm/order_confirm_screen.dart';
import 'package:smart_tailor/presentation/features/clothing_repair/presentation/screens/order_form/cubit/order_cubit.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/theme/app_decoration.dart';
import '../../../../../widgets/appbar.dart';

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
      appBar: CustomAppBarWidget(
        title: 'Замовлення',
        onLeadingButtonPress: () => context.pop(),
      ),
      body: const OrderFormBody(),
    );
  }
}

class OrderFormBody extends StatelessWidget {
  const OrderFormBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Center(
                  child: Column(
                    mainAxisAlignment: .center,
                    mainAxisSize: .min,
                    children: [
                      ConsumerDetailsForm(),
                      SizedBox(height: 20),
                      ButtonWidget(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ConsumerDetailsForm extends StatelessWidget {
  const ConsumerDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    const fieldSpacing = SizedBox(height: 16);
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NameTextField(),
        fieldSpacing,
        MiddleNameTextField(),
        fieldSpacing,
        PhoneTextField(),
        fieldSpacing,
        PriceTextField(),
        fieldSpacing,
        DatePickerFormWidget(),
      ],
    );
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Ім\'я',
            style: textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        BlocBuilder<CreateOrderCubit, CreateOrderState>(
          buildWhen: (prev, curr) => prev.name != curr.name,
          builder: (context, state) {
            return TextField(
              onChanged: (value) =>
                  context.read<CreateOrderCubit>().nameChanged(value),
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              decoration: TextFiledInputDecorations(
                hintText: 'Введіть ім’я',
                errorText: state.name.error,
              ).inputDecoration,
            );
          },
        ),
      ],
    );
  }
}

class MiddleNameTextField extends StatelessWidget {
  const MiddleNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "По батькові",
            style: textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        BlocBuilder<CreateOrderCubit, CreateOrderState>(
          buildWhen: (prev, curr) => prev.middleName != curr.middleName,
          builder: (context, state) {
            return TextField(
              onChanged: (value) =>
                  context.read<CreateOrderCubit>().middleNameChanged(value),
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              decoration: TextFiledInputDecorations(
                hintText: 'Введіть по батькові',
                errorText: state.middleName.error,
              ).inputDecoration,
            );
          },
        ),
      ],
    );
  }
}

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Номер телефону",
            style: textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        BlocBuilder<CreateOrderCubit, CreateOrderState>(
          buildWhen: (prev, curr) => prev.phoneNumber != curr.phoneNumber,
          builder: (context, state) {
            return TextField(
              onChanged: (value) =>
                  context.read<CreateOrderCubit>().phoneChanged(value),
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              decoration: TextFiledInputDecorations(
                hintText: 'Вкажіть номер телефону',
                errorText: state.phoneNumber.error,
              ).inputDecoration,
              keyboardType: TextInputType.number,
            );
          },
        ),
      ],
    );
  }
}

class PriceTextField extends StatelessWidget {
  const PriceTextField({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Ціна замовлення",
            style: textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        BlocBuilder<CreateOrderCubit, CreateOrderState>(
          buildWhen: (prev, curr) => prev.price != curr.price,
          builder: (context, state) {
            return TextField(
              onChanged: (value) =>
                  context.read<CreateOrderCubit>().priceChanged(value),
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              decoration: TextFiledInputDecorations(
                hintText: 'Введіть суму',
                errorText: state.price.error,
              ).inputDecoration,
              keyboardType: TextInputType.number,
            );
          },
        ),
      ],
    );
  }
}

class DatePickerFormWidget extends StatelessWidget {
  const DatePickerFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'Дедлайн',
            style: textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: (textTheme.labelMedium?.fontSize ?? 14) + 2,
            ),
          ),
        ),
        BlocBuilder<CreateOrderCubit, CreateOrderState>(
          buildWhen: (prev, curr) => prev.deadline != curr.deadline,
          builder: (context, state) {
            return TextFormField(
              readOnly: true,
              decoration: TextFiledInputDecorations(
                hintText: 'Оберіть дату',
                errorText: state.deadline.error,
              ).inputDecoration,
              initialValue: state.deadline.value.ddMMyyyy,
              onTap: () => _pickDate(context, state),
            );
          },
        ),
      ],
    );
  }

  Future<void> _pickDate(
    BuildContext context,
    CreateOrderState state,
  ) async {
    final cubit = context.read<CreateOrderCubit>();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: state.deadline.value,
      firstDate: DateTime(2025),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null && context.mounted) {
      cubit.deadlineChanged(pickedDate);
    }
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateOrderCubit, CreateOrderState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == SubmitStatus.success) {
          final data = context.read<CreateOrderCubit>().buildOrderDto();
          context.pushNamed(
            OrderConfirmationScreen.name,
            extra: data,
          );
        }
      },
      child: ElevatedButton(
        onPressed: () {
          context.read<CreateOrderCubit>().submit();
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColor,
          side: const BorderSide(
            color: AppColors.mainDarkBlue,
            width: 1.5,
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 4,
          shadowColor: AppColors.primaryColor,
        ),
        child: Text(
          'Продовжити',
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
