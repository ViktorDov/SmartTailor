import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_tailor/domain/providers/service_data_provider.dart';

part 'order_type_state.dart';

class OrderTypeCubit extends Cubit<OrderTypeState> {
  final _serviceDataProvider = ServiceDataProvider();

  OrderTypeCubit() : super(OrderTypeState()) {
    _init();
  }

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

  Future<void> onTapButtonOrderType() async {
    if (state.selectedOrders.isEmpty) {
      emit(
        state.copyWith(orderTypeError: 'Будь ласка виберіть тип замовлення'),
      );
    } else {
      await _serviceDataProvider.saveOrderType(state.selectedOrders);
      print('OrderType: ${state.selectedOrders} WAS SAVED!');
      // todo:  ^navigation
    }
  }
}
