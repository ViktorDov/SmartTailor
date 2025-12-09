import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_tailor/domain/providers/service_data_provider.dart';

import '../../../../../../../domain/entity/order_type_card.dart';

part 'order_type_state.dart';

class OrderTypeCubit extends Cubit<OrderTypeState> {
  final _serviceDataProvider = ServiceDataProvider();

  OrderTypeCubit() : super(const OrderTypeState()) {
    _init();
  }

  void _init() {
    getOrdersType();
  }

  Future<void> getOrdersType() async {
    Future.delayed(const Duration(seconds: 5));
    emit(state.copyWith(orderTypeStatus: OrderTypeStatus.loading));
    final listOrderTypes = await _serviceDataProvider.getService();
    emit(state.copyWith(orderTypeList: listOrderTypes));
    _serviceDataProvider.closeBox(); // bad practics
  }

  void onIncrementOrderType(int index) {
    final updated = List<OrderTypeCard>.from(state.orderTypeList);
    final current = updated[index];
    updated[index] = current.copyWith(count: current.count + 1);
    emit(state.copyWith(orderTypeList: updated));
  }

  void onDecrementOrderType(int index) {
    final updated = List<OrderTypeCard>.from(state.orderTypeList);
    final current = updated[index];
    if (current.count > 0) {
      updated[index] = current.copyWith(count: current.count - 1);
      emit(state.copyWith(orderTypeList: updated));
    }
  }

  Future<void> onTapButtonOrderType() async {
    _resetStatus();
    if (_selectedOrderTypes.isEmpty) {
      emit(
        state.copyWith(
          errorMessage: 'Будь ласка виберіть тип замовлення',
          orderTypeStatus: OrderTypeStatus.error,
        ),
      );
      return;
    }
    emit(state.copyWith(orderTypeStatus: OrderTypeStatus.success));
    _resetStatus();
  }

  List<OrderTypeCard> get _selectedOrderTypes =>
      state.orderTypeList.where((e) => e.count >= 1).toList();

  void _resetStatus() {
    emit(
      state.copyWith(
        errorMessage: null,
        orderTypeStatus: OrderTypeStatus.initial,
      ),
    );
  }
}
