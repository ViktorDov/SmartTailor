import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_tailor/domain/entity/order.dart';

import '../../../../../domain/entity/order_type_card.dart';

part 'order_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  // final _serviceDataProvider = ServiceDataProvider();
  CreateOrderCubit(List<OrderTypeCard> orderTypes)
    : super(CreateOrderState.initial(orderTypes));

  // function for update order service type
  // void updateOrderServiceType(String serviceType) {
  //   final updatedOrder = state.order.copyWith(orderType: serviceType);

  //   emit(
  //     state.copyWith(
  //       order: updatedOrder,
  //       status: CreateOrderStatus.dataEntry,
  //     ),
  //   );
  // }

  void nameChanged(String name) {
    print('set name: $name');
    // emit(state.copyWith(customerData: CustomerData(customerName: name)));
  }

  void middleNameChanged(String secondName) {
    print('set secondName: $secondName');
    // emit(state.copyWith(customerMiddleName: secondName));
  }

  void phoneChanged(int phoneNumber) {
    print('set phoneNumber: $phoneNumber');
    // emit(state.copyWith(customerPhone: phoneNumber));
  }

  void priceChanged(int orderPrice) {
    // emit(state.copyWith(orderPrice: orderPrice));
  }

  void setDeadline(DateTime deadline) {
    emit(state.copyWith(deadline: deadline));
  }
}
