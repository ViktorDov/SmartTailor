import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'repair_state.dart';

class RepairCubit extends Cubit<RepairState> {
  RepairCubit() : super(const RepairState());

  void addOrterType(String type) {
    final List<String> list = List.from(state.choosedOrderTypeList);
    list.add(type);
    emit(state.copyWith(choosedOrderTypeList: list));
  }
}
