import 'package:flutter/material.dart';

class InfoRow {
  final IconData? icon;
  final String? lable;
  final String value;

  const InfoRow.labeled({
    this.icon,
    required this.lable,
    required this.value,
  });

  // const InfoRow.valueOnly({
  //   required this.lable,
  //   required this.value
  // })
}
