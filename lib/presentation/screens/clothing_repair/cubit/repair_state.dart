// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'repair_cubit.dart';

enum ButtonState { enable, disable, pressed }

class RepairState extends Equatable {
  final ButtonState buttonState;
  final List<String> orderTypeList;
  final List<String> choosedOrderTypeList;
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
    this.choosedOrderTypeList = const <String>[],
  });

  @override
  List<Object> get props => [];

  RepairState copyWith({
    ButtonState? buttonState,
    List<String>? orderTypeList,
    List<String>? choosedOrderTypeList,
  }) {
    return RepairState(
      buttonState: buttonState ?? this.buttonState,
      orderTypeList: orderTypeList ?? this.orderTypeList,
      choosedOrderTypeList: choosedOrderTypeList ?? this.choosedOrderTypeList,
    );
  }
}
