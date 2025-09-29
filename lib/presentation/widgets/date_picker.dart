import 'package:flutter/material.dart';

import '../constants/app_decoration.dart';

class DatePickerField extends StatelessWidget {
  final String label;
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;

  const DatePickerField({
    super.key,
    required this.label,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: () async {
        final now = DateTime.now();
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? now,
          firstDate: now,
          lastDate: DateTime(now.year + 5),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
              ),
              child: child!,
            );
          },
        );
        if (pickedDate != null) {
          onDateSelected(pickedDate);
        }
      },
      decoration: TextFiledInputDecorations(lableText: label).inputDecoration,
      controller: TextEditingController(
        text: selectedDate != null
            ? "${selectedDate!.day.toString().padLeft(2, '0')}/"
                "${selectedDate!.month.toString().padLeft(2, '0')}/"
                "${selectedDate!.year}"
            : '',
      ),
    );
  }
}
