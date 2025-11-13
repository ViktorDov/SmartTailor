import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_state.dart';

class RepairOrderCubit extends Cubit<RepairOrderState> {
  // final _serviceDataProvider = ServiceDataProvider();
  RepairOrderCubit() : super(const RepairOrderState());

  void nameChanged(String name) {
    print('set name: $name');
    emit(state.copyWith(customerName: name));
  }

  void middleNameChanged(String secondName) {
    print('set secondName: $secondName');
    emit(state.copyWith(customerMiddleName: secondName));
  }

  void phoneChanged(int phoneNumber) {
    print('set phoneNumber: $phoneNumber');
    emit(state.copyWith(customerPhone: phoneNumber));
  }

  void priceChanged(int orderPrice) {
    emit(state.copyWith(orderPrice: orderPrice));
  }

  void setDeadline(DateTime deadline) {
    emit(state.copyWith(orderDeadline: deadline));
  }
}
