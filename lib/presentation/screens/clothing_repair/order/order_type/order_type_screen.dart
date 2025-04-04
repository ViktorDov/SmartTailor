import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_tailor/presentation/screens/clothing_repair/cubit/repair_cubit.dart';
import '../../../home.dart';

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
      appBar: AppBar(
        title: const Text('Тип замовлення'),
        centerTitle: false,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => context.goNamed(HomeScreen.name),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          const OrderTypeList(),
          const OrderTypeButton(),
        ],
      ),
    );
  }
}

class OrderTypeList extends StatelessWidget {
  const OrderTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepairCubit, RepairState>(
      builder: (context, state) {
        final orderTypeList = state.orderTypeList;
        return Expanded(
          child: ListView.builder(
            itemCount: orderTypeList.length,
            itemBuilder: (context, index) {
              String order = orderTypeList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        double tapX = details.localPosition.dx;
                        double halfWidth = constraints.maxWidth / 2;
                        context.read<RepairCubit>().onTapOrderElement(
                            tapX: tapX, halfWidth: halfWidth, order: order);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 40),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            order,
                            style: GoogleFonts.abel(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class OrderTypeButton extends StatefulWidget {
  const OrderTypeButton({super.key});

  @override
  State<OrderTypeButton> createState() => _OrderTypeButtonState();
}

class _OrderTypeButtonState extends State<OrderTypeButton> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<RepairCubit, RepairState, int>(
      selector: (state) => state.selectedOrders.length,
      builder: (context, orderCount) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Center(
            child: Column(
              children: [
                Text('Count order: $orderCount'),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Підтвердити замовлення",
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
