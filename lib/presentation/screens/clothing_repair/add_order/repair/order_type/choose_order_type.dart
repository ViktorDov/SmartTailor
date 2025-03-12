import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tailor/presentation/screens/clothing_repair/cubit/repair_cubit.dart';
import '../../../../home.dart' show HomeScreen;

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
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => context.goNamed(HomeScreen.name),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocBuilder<RepairCubit, RepairState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.orderTypeList.length,
            itemBuilder: (context, index) {
              String workType = state.orderTypeList[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        // double tapX = details.localPosition.dx;
                        // double halfWidth = constraints.maxWidth / 2;
                        // String side = tapX < halfWidth ? 'Ліва' : 'Права';
                        context.read<RepairCubit>().addOrterType(workType);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            workType,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// class ChooseOrderTypeBody extends StatelessWidget {
//   final List<String> workTypes = [
    // "Усунення дірки",
    // "Вставити замочок",
    // "Підрубити",
    // "Вкоротити",
    // "Кармани",
    // "Вставити замочок",
    // "Підрубити",
    // "Вкоротити",
    // "Кармани",
//   ];

//   ChooseOrderTypeBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: ,
//       itemBuilder: (context, index) {
//         String workType = workTypes[index];
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               return GestureDetector(
//                 onTapDown: (TapDownDetails details) {
//                   double tapX = details.localPosition.dx;
//                   double halfWidth = constraints.maxWidth / 2;
//                   context.read<RepairCubit>().getCoins();
//                   String side = tapX < halfWidth ? 'Ліва' : 'Права';
//                   print('Натиснуто на $side сторону: $workType');
//                 },
//                 child: Container(
//                   width: double.infinity, // Розтягується на всю ширину
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                     child: Text(
//                       workType,
//                       style: const TextStyle(color: Colors.black, fontSize: 18),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
