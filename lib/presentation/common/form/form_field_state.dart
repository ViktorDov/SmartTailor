enum FieldStatus { pure, invalid, valid }

class FormFieldState<T> {
  final FieldStatus status;
  final T value;
  final String? error;
  const FormFieldState({
    required this.value,
    this.error,
    required this.status,
  });

  bool get isValid => status == FieldStatus.valid;
  bool get shouldShowError => status == FieldStatus.invalid;

  factory FormFieldState.pure(T value) {
    return FormFieldState(value: value, status: FieldStatus.pure);
  }

  FormFieldState<T> invalid(String error) {
    return FormFieldState(
      value: value,
      error: error,
      status: FieldStatus.invalid,
    );
  }

  FormFieldState<T> valid() {
    return FormFieldState(
      value: value,
      status: FieldStatus.valid,
    );
  }

  List<Object?> get props => [value, status, error];

  // static const emptyString = FormFieldState<String?>(value: null);
  // static const emptyInt = FormFieldState<int?>(value: null);
  // static const emptyDate = FormFieldState<DateTime?>(value: null);
  // bool get isValide => error == null;

  // FormFieldState<T> copyWith({T? value, String? error}) {
  //   return FormFieldState<T>(
  //     value: value ?? this.value,
  //     error: error,
  //   );
  // }
}
