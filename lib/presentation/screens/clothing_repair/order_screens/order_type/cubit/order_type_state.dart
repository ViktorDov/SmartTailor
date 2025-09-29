part of 'order_type_cubit.dart';

enum OrderTypeStatus { initial, success, error, loading }

class OrderTypeState extends Equatable {
  final List<String> orderTypeList;
  final List<String> selectedOrders;
  final String? errorMessage;
  final OrderTypeStatus orderTypeStatus;
  final bool navigateNext;

  const OrderTypeState({
    this.orderTypeList = const <String>[],
    this.selectedOrders = const <String>[],
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
        navigateNext
      ];

  OrderTypeState copyWith({
    List<String>? orderTypeList,
    List<String>? selectedOrders,
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
