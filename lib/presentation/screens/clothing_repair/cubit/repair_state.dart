part of 'repair_cubit.dart';

enum ButtonState { enable, disable, pressed }

class RepairState extends Equatable {
  final ButtonState buttonState;

  final String? customerName;
  final String? customerSecondName;
  final int? customerPhone;
  final String? masterTailor;
  final DateTime? orderDeadline;
  final int? orderPrice;

  const RepairState({
    this.buttonState = ButtonState.disable,
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
        customerName,
        customerSecondName,
        customerPhone,
        masterTailor,
        orderDeadline,
        orderPrice,
      ];

  RepairState copyWith({
    ButtonState? buttonState,
    String? customerName,
    String? customerSecondName,
    int? customerPhone,
    String? masterTailor,
    DateTime? orderDeadline,
    int? orderPrice,
  }) {
    return RepairState(
      buttonState: buttonState ?? this.buttonState,
      customerName: customerName ?? this.customerName,
      customerSecondName: customerSecondName ?? this.customerSecondName,
      customerPhone: customerPhone ?? this.customerPhone,
      masterTailor: masterTailor ?? this.masterTailor,
      orderDeadline: orderDeadline ?? this.orderDeadline,
      orderPrice: orderPrice ?? this.orderPrice,
    );
  }
}
