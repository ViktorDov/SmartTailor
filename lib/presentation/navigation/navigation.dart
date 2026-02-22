import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tailor/presentation/features/clothing_repair/presentation/screens/order_form/cubit/order_cubit.dart';
import 'package:smart_tailor/presentation/features/clothing_repair/presentation/screens/order_confirm/order_confirm_screen.dart';
import '../../domain/entity/order.dart';
import '../../domain/entity/order_type_card.dart';
import '../features/clothing_repair/presentation/screens/order_type/order_type_screen.dart';
import '../features/clothing_repair/presentation/screens/order_form/order_form_screen.dart';
import '../features/home.dart';

class Navigation {
  static final GoRouter router = GoRouter(
    initialLocation: HomeScreen.path,
    routes: <RouteBase>[
      GoRoute(
        path: HomeScreen.path,
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: OrderTypeScreen.path,
        name: OrderTypeScreen.name,
        builder: (context, state) => const OrderTypeScreen(),
      ),
      GoRoute(
        path: OrderFormScreen.path,
        name: OrderFormScreen.name,
        builder: (context, state) {
          final types = state.extra as List<OrderTypeCard>;

          return BlocProvider(
            create: (_) => CreateOrderCubit(types),
            child: const OrderFormScreen(),
          );
        },
        routes: [
          GoRoute(
            path: OrderConfirmationScreen.path,
            name: OrderConfirmationScreen.name,
            builder: (context, state) {
              final order = state.extra as Order;

              return OrderConfirmationScreen(orderInfo: order);
            },
          ),
        ],
      ),
    ],
  );
}
