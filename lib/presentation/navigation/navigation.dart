import 'package:go_router/go_router.dart';
import '../screens/clothing_repair/order_screens/order_type/order_type_screen.dart';
import '../screens/clothing_repair/order_screens/order_form/order_form_screen.dart';
import '../screens/home.dart';

class Navigation {
  static final GoRouter router = GoRouter(
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
    ],
  );
}
