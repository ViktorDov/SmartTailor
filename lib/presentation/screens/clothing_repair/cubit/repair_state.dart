part of 'repair_cubit.dart';

enum ButtonState { enable, disable, pressed }

class RepairState extends Equatable {
  final ButtonState buttonState;
  final List<String> orderTypeList;
  final List<String> selectedOrders;
  final DateTime? deadLine;
  final String? customerName;
  final String? customerSecondName;
  final int? customerPhone;
  final String? masterTailor;
  final DateTime? orderDeadline;
  final int? totalPrice;

  const RepairState({
    this.buttonState = ButtonState.disable,
    this.deadLine,
    this.selectedOrders = const <String>[],
    this.orderTypeList = const <String>[],
    this.customerName,
    this.customerSecondName,
    this.customerPhone,
    this.masterTailor,
    this.orderDeadline,
    this.totalPrice,
  });

  @override
  List<Object?> get props => [
        buttonState,
        orderTypeList,
        deadLine,
        selectedOrders,
        customerName,
        customerSecondName,
        customerPhone,
        masterTailor,
        orderDeadline,
        totalPrice,
      ];

  RepairState copyWith({
    ButtonState? buttonState,
    List<String>? orderTypeList,
    DateTime? deadLine,
    List<String>? selectedOrders,
    String? customerName,
    String? customerSecondName,
    int? customerPhone,
    String? masterTailor,
    DateTime? orderDeadline,
    int? totalPrice,
  }) {
    return RepairState(
      buttonState: buttonState ?? this.buttonState,
      orderTypeList: orderTypeList ?? this.orderTypeList,
      deadLine: deadLine ?? this.deadLine,
      selectedOrders: selectedOrders ?? this.selectedOrders,
      customerName: customerName ?? this.customerName,
      customerSecondName: customerSecondName ?? this.customerSecondName,
      customerPhone: customerPhone ?? this.customerPhone,
      masterTailor: masterTailor ?? this.masterTailor,
      orderDeadline: orderDeadline ?? this.orderDeadline,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
