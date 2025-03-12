import 'package:go_router/go_router.dart';
import '../screens/clothing_repair/add_order/repair/order_type/choose_order_type.dart';
import '../screens/clothing_repair/add_order/repair/create_order_data.dart';
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
        path: AddOrderScreenWidget.path,
        name: AddOrderScreenWidget.name,
        builder: (context, state) => const AddOrderScreenWidget(),
      ),
      GoRoute(
        path: OrderTypeScreen.path,
        name: OrderTypeScreen.name,
        builder: (context, state) => const OrderTypeScreen(),
      ),
    ],
  );
}
