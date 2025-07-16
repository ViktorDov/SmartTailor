part of 'order_type_cubit.dart';

enum ButtonState { enable, disable, pressed }

class OrderTypeState extends Equatable {
  final List<String> orderTypeList;
  final List<String> selectedOrders;
  final String orderTypeError;
  final ButtonState buttonState;

  const OrderTypeState(
      {this.orderTypeList = const <String>[],
      this.selectedOrders = const <String>[],
      this.orderTypeError = '',
      this.buttonState = ButtonState.disable});

  @override
  List<Object> get props =>
      [orderTypeList, selectedOrders, orderTypeError, buttonState];

  OrderTypeState copyWith({
    List<String>? orderTypeList,
    List<String>? selectedOrders,
    String? orderTypeError,
    ButtonState? buttonState,
  }) {
    return OrderTypeState(
      orderTypeList: orderTypeList ?? this.orderTypeList,
      selectedOrders: selectedOrders ?? this.selectedOrders,
      orderTypeError: orderTypeError ?? this.orderTypeError,
      buttonState: buttonState ?? this.buttonState,
    );
  }
}
