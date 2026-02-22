import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../../domain/entity/order.dart';
import '../../../../../../../domain/entity/order_type_card.dart';
import '../../../../../../common/form/form_field_state.dart';

part 'order_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  final List<OrderTypeCard> order;
  CreateOrderCubit(this.order) : super(CreateOrderState.initial(order));

  void nameChanged(String value) {
    final name = FormFieldState.pure(value);
    _updateState(name: _validateName(name));
  }

  void middleNameChanged(String value) {
    final middleName = FormFieldState.pure(value);
    _updateState(secondName: _validateName(middleName));
  }

  void phoneChanged(String value) {
    final phone = FormFieldState.pure(value);
    _updateState(phoneNumber: _validatePhone(phone));
  }

  void priceChanged(String value) {
    final price = FormFieldState.pure(value);
    _updateState(price: _validatePrice(price));
  }

  void deadlineChanged(DateTime value) {
    final deadline = FormFieldState.pure(value);
    _updateState(deadline: _validateDeadline(deadline));
  }

  Order buildOrderDto() {
    return Order(
      customerName: state.name.value,
      customerMiddleName: state.middleName.value,
      orderType: state.orderType,
      phoneNumber: state.phoneNumber.value,
      prise: int.parse(state.price.value),
      deadline: state.deadline.value,
      assignedMaster: 'assignedMaster',
    );
  }

  void submit() {
    final validatedState = state.copyWith(
      isSubmitted: true,
      name: _validateName(state.name),
      middleName: _validateName(state.middleName),
      phoneNumber: _validatePhone(state.phoneNumber),
      price: _validatePrice(state.price),
      deadline: _validateDeadline(state.deadline),
    );
    emit(validatedState);

    if (!validatedState.isFormValid) return;
    emit(validatedState.copyWith(status: SubmitStatus.success));
  }

  void _updateState({
    FormFieldState<String>? name,
    FormFieldState<String>? secondName,
    FormFieldState<String>? phoneNumber,
    FormFieldState<String>? price,
    FormFieldState<DateTime>? deadline,
  }) {
    emit(
      state.copyWith(
        name: name,
        middleName: secondName,
        phoneNumber: phoneNumber,
        price: price,
        deadline: deadline,
      ),
    );
  }

  // --- validation ---
  FormFieldState<String> _validateName(FormFieldState<String> field) {
    if (field.value.trim().isEmpty) {
      return field.invalid("Обов'язкове поле");
    }
    if (field.value.length <= 2) {
      return field.invalid("Введіть коректне ім'я");
    }

    return field.valid();
  }

  FormFieldState<String> _validatePhone(FormFieldState<String> field) {
    if (field.value.trim().isEmpty) {
      return field.invalid('Некоректний номер телефону');
    } else if (field.value.length > 13 || field.value.length < 8) {
      return field.invalid("Номер телефону вказаний не коректно");
    }
    return field.valid();
  }

  FormFieldState<String> _validatePrice(FormFieldState<String> field) {
    if (field.value.trim().isEmpty) {
      return field.invalid("Вкажіть ціну замовлення");
    }
    return field.valid();
  }

  FormFieldState<DateTime> _validateDeadline(FormFieldState<DateTime> field) {
    if (field.value.isBefore(DateTime.now())) {
      return field.invalid('Введіть коректний дедлайн замовлення');
    }
    return field.valid();
  }
}
