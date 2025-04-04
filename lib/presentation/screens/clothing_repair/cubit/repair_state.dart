// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'repair_cubit.dart';

enum ButtonState { enable, disable, pressed }

class RepairState extends Equatable {
  final ButtonState buttonState;
  final List<String> orderTypeList;
  final List<String> selectedOrders;
  final OrderData? orderData;

  const RepairState({
    this.buttonState = ButtonState.disable,
    this.orderData,
    this.selectedOrders = const <String>[],
    this.orderTypeList = const <String>[
      "Усунення дірки",
      "Вставити замочок",
      "Підрубити",
      "Вкоротити",
      "Кармани",
      "Вставити замочок",
      "Підрубити",
      "Вкоротити",
      "Кармани"
    ],
  });

  @override
  List<Object?> get props =>
      [buttonState, orderTypeList, selectedOrders, orderData];

  RepairState copyWith({
    ButtonState? buttonState,
    List<String>? orderTypeList,
    List<String>? selectedOrders,
    OrderData? orderData,
  }) {
    return RepairState(
      buttonState: buttonState ?? this.buttonState,
      orderTypeList: orderTypeList ?? this.orderTypeList,
      selectedOrders: selectedOrders ?? this.selectedOrders,
      orderData: orderData ?? this.orderData,
    );
  }
}

class OrderData {
  final String customerName;
  final String customerSecondName;
  final String customerPhone;
  final String masterTailor;
  final DateTime orderDeadline;
  final int totalPrice;

  OrderData({
    required this.customerName,
    required this.customerSecondName,
    required this.customerPhone,
    required this.masterTailor,
    required this.orderDeadline,
    required this.totalPrice,
  });
}
