part of 'repair_cubit.dart';

enum ButtonState { enable, disable, pressed }

class RepairState extends Equatable {
  final ButtonState buttonState;

  final DateTime? deadLine;
  final String? customerName;
  final String? customerSecondName;
  final int? customerPhone;
  final String? masterTailor;
  final DateTime? orderDeadline;
  final int? orderPrice;

  const RepairState({
    this.buttonState = ButtonState.disable,
    this.deadLine,
    this.customerName,
    this.customerSecondName,
    this.customerPhone,
    this.masterTailor,
    this.orderDeadline,
    this.orderPrice,
  });

  @override
  List<Object?> get props => [
        buttonState,
        deadLine,
        customerName,
        customerSecondName,
        customerPhone,
        masterTailor,
        orderDeadline,
        orderPrice,
      ];

  RepairState copyWith({
    ButtonState? buttonState,
    DateTime? deadLine,
    String? customerName,
    String? customerSecondName,
    int? customerPhone,
    String? masterTailor,
    DateTime? orderDeadline,
    int? orderPrice,
  }) {
    return RepairState(
      buttonState: buttonState ?? this.buttonState,
      deadLine: deadLine ?? this.deadLine,
      customerName: customerName ?? this.customerName,
      customerSecondName: customerSecondName ?? this.customerSecondName,
      customerPhone: customerPhone ?? this.customerPhone,
      masterTailor: masterTailor ?? this.masterTailor,
      orderDeadline: orderDeadline ?? this.orderDeadline,
      orderPrice: orderPrice ?? this.orderPrice,
    );
  }
}
