import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'repair_state.dart';

class RepairCubit extends Cubit<RepairState> {
  RepairCubit() : super(const RepairState());

  void _addOrterType(String order) {
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
      _addOrterType(order);
    }
  }
}
