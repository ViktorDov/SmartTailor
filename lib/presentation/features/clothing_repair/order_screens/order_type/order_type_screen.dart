import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_tailor/presentation/features/clothing_repair/widgets/order_card.dart';
import '../../../home.dart';
import '../order_form/order_form_screen.dart';
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
      appBar: AppBar(
        title: const Text('Тип замовлення'),
        centerTitle: false,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => context.goNamed(HomeScreen.name),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: const Column(
        children: [
          OrderTypeList(),
          OrderTypeButton(),
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
          separatorBuilder: (_, _) => const Divider(height: 18),
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

// class OrderTypeList extends StatelessWidget {
//   const OrderTypeList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<OrderTypeCubit, OrderTypeState>(
//       builder: (context, state) {
//         final orderTypeList = state.orderTypeList;
//         return Expanded(
//           child: ListView.builder(
//             itemCount: orderTypeList.length,
//             itemBuilder: (context, index) {
//               String order = orderTypeList[index];
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: LayoutBuilder(
//                   builder: (context, constraints) {
//                     return GestureDetector(
//                       onTapDown: (TapDownDetails details) {
//                         double tapX = details.localPosition.dx;
//                         double halfWidth = constraints.maxWidth / 2;
//                         context.read<OrderTypeCubit>().onTapOrderElement(
//                           tapX: tapX,
//                           halfWidth: halfWidth,
//                           order: order,
//                         );
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 16,
//                           horizontal: 40,
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black),
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Center(
//                           child: Text(
//                             order,
//                             style: GoogleFonts.abel(
//                               color: Colors.black,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

class OrderTypeButton extends StatelessWidget {
  const OrderTypeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderTypeCubit, OrderTypeState>(
      listenWhen: (prev, curr) => prev.orderTypeStatus != curr.orderTypeStatus,
      listener: (context, state) {
        if (state.orderTypeStatus == OrderTypeStatus.error &&
            state.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        } else if (state.orderTypeStatus == OrderTypeStatus.success) {
          context.pushNamed(OrderFormScreen.name);
          context.read<OrderTypeCubit>().resetStatus();
        }
      },
      child: Column(
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
      ),
    );
  }
}
