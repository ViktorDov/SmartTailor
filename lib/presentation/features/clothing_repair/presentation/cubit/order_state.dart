part of 'order_cubit.dart';

enum CreateOrderStatus {
  initial,
  loading,
  success,
  failure,
  dataEntry,
}

class CustomerData {
  final String? customerName;
  final String? customerSecondName;
  final int? phoneNumber;

  CustomerData({
    this.customerName,
    this.customerSecondName,
    this.phoneNumber,
  });
}

class CreateOrderState extends Equatable {
  final Order order;
  final DateTime deadline;
  final CustomerData customerData;
  final CreateOrderStatus status;

  const CreateOrderState({
    this.status = CreateOrderStatus.initial,
    required this.customerData,
    required this.deadline,
    required this.order,
  });

  factory CreateOrderState.initial(List<OrderTypeCard> orderType) {
    return CreateOrderState(
      order: Order.empty(orderType),
      deadline: DateTime.now(),
      customerData: CustomerData(
        customerName: '',
        customerSecondName: '',
        phoneNumber: 1,
      ),
    );
  }

  @override
  List<Object?> get props => [
    order,
    customerData,
    deadline,
    status,
  ];

  CreateOrderState copyWith({
    Order? order,
    DateTime? deadline,
    CustomerData? customerData,
    CreateOrderStatus? status,
  }) {
    return CreateOrderState(
      order: order ?? this.order,
      deadline: deadline ?? this.deadline,
      customerData: customerData ?? this.customerData,
      status: status ?? this.status,
    );
  }
}
