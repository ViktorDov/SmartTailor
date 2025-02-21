import 'package:go_router/go_router.dart';
import '../screens/add_order/repair/choose_order_type.dart';
import '../screens/add_order/repair/create_order_data.dart';
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
        path: ChooseOrderTypeWidget.path,
        name: ChooseOrderTypeWidget.name,
        builder: (context, state) => const ChooseOrderTypeWidget(),
      ),
    ],
  );
}
