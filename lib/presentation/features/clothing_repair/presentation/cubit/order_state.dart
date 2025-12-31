part of 'order_cubit.dart';

enum CreateOrderStatus {
  initial,
  loading,
  success,
  failure,
  dataEntry,
}

class CustomerData {
  final String? name;
  final String? secondName;
  final int? phoneNumber;

  CustomerData({
    this.name,
    this.secondName,
    this.phoneNumber,
  });
}

class CreateOrderState extends Equatable {
  final Order order;
  final DateTime? deadline;
  final int price;
  final CustomerData customerData;
  final CreateOrderStatus status;

  const CreateOrderState({
    this.status = CreateOrderStatus.initial,
    required this.customerData,
    required this.price,
    this.deadline,
    required this.order,
  });

  factory CreateOrderState.initial(List<OrderTypeCard> orderType) {
    return CreateOrderState(
      order: Order.empty(orderType),
      price: 0,
      customerData: CustomerData(
        name: '',
        secondName: '',
        phoneNumber: 1,
      ),
    );
  }

  @override
  List<Object?> get props => [
    order,
    customerData,
    price,
    deadline,
    status,
  ];

  CreateOrderState copyWith({
    Order? order,
    DateTime? deadline,
    int? price,
    CustomerData? customerData,
    CreateOrderStatus? status,
  }) {
    return CreateOrderState(
      order: order ?? this.order,
      price: price ?? this.price,
      deadline: deadline ?? this.deadline,
      customerData: customerData ?? this.customerData,
      status: status ?? this.status,
    );
  }
}
