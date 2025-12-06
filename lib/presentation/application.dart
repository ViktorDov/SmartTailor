import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tailor/presentation/features/clothing_repair/presentation/cubit/order_cubit.dart';
import 'package:smart_tailor/presentation/features/clothing_repair/presentation/screens/order_type/cubit/order_type_cubit.dart';

import 'navigation/navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RepairOrderCubit>(
          create: (BuildContext context) => RepairOrderCubit(),
        ),
        BlocProvider<OrderTypeCubit>(
          create: (BuildContext context) => OrderTypeCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        routerConfig: Navigation.router,
      ),
    );
  }
}
