part of 'order_cubit.dart';

enum ButtonState { enable, disable, pressed }

class RepairOrderState extends Equatable {
  final String? customerName;
  final String? customerMiddleName;
  final int? customerPhone;
  final String? masterTailor;
  final DateTime? orderDeadline;
  final int? orderPrice;

  const RepairOrderState({
    this.customerName,
    this.customerMiddleName,
    this.customerPhone,
    this.masterTailor,
    this.orderDeadline,
    this.orderPrice,
  });

  @override
  List<Object?> get props => [
    customerName,
    customerMiddleName,
    customerPhone,
    masterTailor,
    orderDeadline,
    orderPrice,
  ];

  RepairOrderState copyWith({
    ButtonState? buttonState,
    String? customerName,
    String? customerMiddleName,
    int? customerPhone,
    String? masterTailor,
    DateTime? orderDeadline,
    int? orderPrice,
  }) {
    return RepairOrderState(
      customerName: customerName ?? this.customerName,
      customerMiddleName: customerMiddleName ?? this.customerMiddleName,
      customerPhone: customerPhone ?? this.customerPhone,
      masterTailor: masterTailor ?? this.masterTailor,
      orderDeadline: orderDeadline ?? this.orderDeadline,
      orderPrice: orderPrice ?? this.orderPrice,
    );
  }
}
