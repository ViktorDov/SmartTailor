import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'repair_state.dart';

class RepairCubit extends Cubit<RepairState> {
  // final _serviceDataProvider = ServiceDataProvider();
  RepairCubit() : super(const RepairState());

  void nameChanged(String name) {
    print('set name: $name');
    emit(state.copyWith(customerName: name));
  }

  void middleNameChanged(String secondName) {
    print('set secondName: $secondName');
    emit(state.copyWith(customerSecondName: secondName));
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
