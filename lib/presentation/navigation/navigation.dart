import 'package:go_router/go_router.dart';
import '../screens/clothing_repair/order/order_type/order_type_screen.dart';
import '../screens/clothing_repair/order/consumer_data/create_order_data.dart';
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
