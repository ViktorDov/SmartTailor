part of 'order_confirm_cubit.dart';

class OrderConfirmationState extends Equatable {
  final Order order;
  const OrderConfirmationState({required this.order});

  @override
  List<Object> get props => [order];
}
