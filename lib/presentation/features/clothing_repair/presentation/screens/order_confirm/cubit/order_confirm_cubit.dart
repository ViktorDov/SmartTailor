import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../domain/entity/order.dart';

part 'order_confirm_state.dart';

class OrderConfirmationCubit extends Cubit<OrderConfirmationState> {
  OrderConfirmationCubit(Order order)
    : super(OrderConfirmationState(order: order));
  // OrderConfirmationCubit(Order order)());
}
