import 'package:go_router/go_router.dart';
import 'package:smart_tailor/presentation/screens/clothing_repair/order_screens/confirm_order/confirm_screen.dart';
import '../screens/clothing_repair/order_screens/order_type/order_type_screen.dart';
import '../screens/clothing_repair/order_screens/order_form/order_form_screen.dart';
import '../screens/home.dart';

class Navigation {
  static final GoRouter router = GoRouter(
    initialLocation: ConfirmOrderScreen.path,
    routes: <RouteBase>[
      GoRoute(
        path: HomeScreen.path,
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: OrderFormScreen.path,
        name: OrderFormScreen.name,
        builder: (context, state) => const OrderFormScreen(),
      ),
      GoRoute(
        path: OrderTypeScreen.path,
        name: OrderTypeScreen.name,
        builder: (context, state) => const OrderTypeScreen(),
      ),
      GoRoute(
        path: ConfirmOrderScreen.path,
        name: ConfirmOrderScreen.name,
        builder: (context, state) => const ConfirmOrderScreen(),
      ),
    ],
  );
}
