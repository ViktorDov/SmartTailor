part of 'order_type_cubit.dart';

enum OrderTypeStatus { initial, success, error, loading }

class OrderTypeState extends Equatable {
  final List<OrderTypeCard> orderTypeList;
  final List<OrderTypeCard> selectedOrders;
  final String? errorMessage;
  final OrderTypeStatus orderTypeStatus;
  final bool navigateNext;

  const OrderTypeState({
    this.orderTypeList = const <OrderTypeCard>[],
    this.selectedOrders = const <OrderTypeCard>[],
    this.errorMessage,
    this.orderTypeStatus = OrderTypeStatus.initial,
    this.navigateNext = false,
  });

  @override
  List<Object?> get props => [
    orderTypeList,
    selectedOrders,
    errorMessage,
    orderTypeStatus,
    navigateNext,
  ];

  OrderTypeState copyWith({
    List<OrderTypeCard>? orderTypeList,
    List<OrderTypeCard>? selectedOrders,
    String? errorMessage,
    OrderTypeStatus? orderTypeStatus,
    bool? navigateNext,
  }) {
    return OrderTypeState(
      orderTypeList: orderTypeList ?? this.orderTypeList,
      selectedOrders: selectedOrders ?? this.selectedOrders,
      errorMessage: errorMessage ?? this.errorMessage,
      orderTypeStatus: orderTypeStatus ?? this.orderTypeStatus,
      navigateNext: navigateNext ?? this.navigateNext,
    );
  }
}
