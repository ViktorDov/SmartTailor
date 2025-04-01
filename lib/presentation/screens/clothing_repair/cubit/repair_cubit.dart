import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'repair_state.dart';

class RepairCubit extends Cubit<RepairState> {
  RepairCubit() : super(const RepairState());

  void addOrterType(String type) {
    final List<String> newList = List.from(state.selectedOrders)..add(type);
    emit(state.copyWith(selectedOrders: newList));
  }
}
