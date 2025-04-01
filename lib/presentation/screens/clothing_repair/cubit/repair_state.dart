// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'repair_cubit.dart';

enum ButtonState { enable, disable, pressed }

class RepairState extends Equatable {
  final ButtonState buttonState;
  final List<String> orderTypeList;
  final List<String> selectedOrders;
  const RepairState({
    this.buttonState = ButtonState.disable,
    this.orderTypeList = const <String>[
      "Усунення дірки",
      "Вставити замочок",
      "Підрубити",
      "Вкоротити",
      "Кармани",
      "Вставити замочок",
      "Підрубити",
      "Вкоротити",
      "Кармани"
    ],
    this.selectedOrders = const <String>[],
  });

  @override
  List<Object> get props => [buttonState, orderTypeList, selectedOrders];

  RepairState copyWith({
    ButtonState? buttonState,
    List<String>? orderTypeList,
    List<String>? selectedOrders,
  }) {
    return RepairState(
      buttonState: buttonState ?? this.buttonState,
      orderTypeList: orderTypeList ?? this.orderTypeList,
      selectedOrders: selectedOrders ?? this.selectedOrders,
    );
  }
}
