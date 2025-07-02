import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../domain/providers/service_data_provider.dart';
import '../order_screens/order_form/order_form_screen.dart';

part 'repair_state.dart';

class RepairCubit extends Cubit<RepairState> {
  final _serviceDataProvider = ServiceDataProvider();
  RepairCubit() : super(const RepairState()) {
    _init();
  }
  // order type screen fun
  void _init() {
    getOrdersType();
  }

  Future<void> getOrdersType() async {
    final listOrderTypes = await _serviceDataProvider.get();
    emit(state.copyWith(orderTypeList: listOrderTypes));
    _serviceDataProvider.closeBox();
  }

  void _addOrderType(String order) {
    final List<String> newList = List.from(state.selectedOrders)..add(order);
    emit(state.copyWith(selectedOrders: newList));
  }

  void _removeOrderType(String order) {
    final List<String> newList = List.from(state.selectedOrders)..remove(order);
    emit(state.copyWith(selectedOrders: newList));
  }

  void onTapOrderElement({
    required String order,
    required double tapX,
    required double halfWidth,
  }) {
    if (tapX < halfWidth) {
      _removeOrderType(order);
    } else {
      _addOrderType(order);
    }
  }

  void onTapButtonOrderType(BuildContext context) {
    if (state.selectedOrders.isEmpty) {
      return;
      // todo error msg
    } else {
      context.goNamed(OrderFormScreen.name);
    }
  }

  // order form screen fun
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
}
