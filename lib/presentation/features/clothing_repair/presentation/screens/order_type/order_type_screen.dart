import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_tailor/presentation/features/clothing_repair/widgets/order_card.dart';
import 'package:smart_tailor/presentation/widgets/appbar.dart';
import '../../../../home.dart';
import 'cubit/order_type_cubit.dart';

class OrderTypeScreen extends StatefulWidget {
  static const String path = '/choose_type';
  static const String name = 'chooseType';
  const OrderTypeScreen({super.key});

  @override
  State<OrderTypeScreen> createState() => _OrderTypeScreenState();
}

class _OrderTypeScreenState extends State<OrderTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Тип замовлення',
        onPressed: () => context.goNamed(HomeScreen.name),
      ),
      body: const Column(
        children: [
          Expanded(
            child: OrderTypeList(),
          ),
          OrderTypeButton(),
          ErrorHandlerSnackBar(),
        ],
      ),
    );
  }
}

class OrderTypeList extends StatelessWidget {
  const OrderTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderTypeCubit, OrderTypeState>(
      builder: (context, state) {
        return ListView.separated(
          separatorBuilder: (_, _) => const Divider(height: 13),
          itemCount: state.orderTypeList.length,
          itemBuilder: (context, index) {
            final order = state.orderTypeList[index];
            return OrderTypeCardWidget(
              order: order,
              onIncrement: () =>
                  context.read<OrderTypeCubit>().onIncrementOrderType(index),
              onDecrement: () =>
                  context.read<OrderTypeCubit>().onDecrementOrderType(index),
            );
          },
        );
      },
    );
  }
}

class OrderTypeButton extends StatelessWidget {
  const OrderTypeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<OrderTypeCubit>().onTapButtonOrderType();
          },
          child: Text(
            "Підтвердити замовлення",
            style: GoogleFonts.poppins(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class ErrorHandlerSnackBar extends StatelessWidget {
  const ErrorHandlerSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderTypeCubit, OrderTypeState>(
      listenWhen: (prev, curr) => prev.orderTypeStatus != curr.orderTypeStatus,
      listener: (BuildContext context, state) {
        if (state.orderTypeStatus == OrderTypeStatus.error &&
            state.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
