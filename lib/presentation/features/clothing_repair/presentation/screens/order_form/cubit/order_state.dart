part of 'order_cubit.dart';

enum SubmitStatus { idle, submitting, success, failure }

class CreateOrderState extends Equatable {
  final Order order;
  final bool isSubmitted;
  final List<OrderTypeCard> orderType;
  final SubmitStatus status;
  final FormFieldState<String> name;
  final FormFieldState<String> middleName;
  final FormFieldState<String> phoneNumber;
  final FormFieldState<DateTime> deadline;
  final FormFieldState<String> price;
  final FormFieldState<String> assignedMaster;
  const CreateOrderState({
    required this.orderType,
    required this.isSubmitted,
    required this.order,
    this.status = SubmitStatus.idle,
    required this.name,
    required this.middleName,
    required this.phoneNumber,
    required this.deadline,
    required this.price,
    required this.assignedMaster,
  });

  factory CreateOrderState.initial(List<OrderTypeCard> orderType) {
    return CreateOrderState(
      order: Order.empty(orderType),
      isSubmitted: false,
      orderType: orderType,
      name: FormFieldState.pure(''),
      middleName: FormFieldState.pure(''),
      phoneNumber: FormFieldState.pure(''),
      price: FormFieldState.pure(''),
      deadline: FormFieldState.pure(DateTime.now()),
      assignedMaster: FormFieldState.pure(''),
    );
  }

  bool get isFormValid =>
      name.isValid &&
      middleName.isValid &&
      phoneNumber.isValid &&
      deadline.isValid &&
      price.isValid;

  @override
  List<Object?> get props => [
    order,
    isSubmitted,
    orderType,
    status,
    name,
    middleName,
    phoneNumber,
    deadline,
    price,
    assignedMaster,
  ];

  CreateOrderState copyWith({
    Order? order,
    bool? isSubmitted,
    List<OrderTypeCard>? orderType,
    SubmitStatus? status,
    FormFieldState<String>? name,
    FormFieldState<String>? middleName,
    FormFieldState<String>? phoneNumber,
    FormFieldState<DateTime>? deadline,
    FormFieldState<String>? price,
    FormFieldState<String>? assignedMaster,
  }) {
    return CreateOrderState(
      order: order ?? this.order,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      orderType: orderType ?? this.orderType,
      status: status ?? this.status,
      name: name ?? this.name,
      middleName: middleName ?? this.middleName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      deadline: deadline ?? this.deadline,
      price: price ?? this.price,
      assignedMaster: assignedMaster ?? this.assignedMaster,
    );
  }
}
