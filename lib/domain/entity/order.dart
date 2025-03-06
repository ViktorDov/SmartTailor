import 'dart:convert';

class Order {
  final String customerName;
  final String phoneNumber;
  final int prise;
  final DateTime deadline;
  final String assignedMaster;
  Order({
    required this.customerName,
    required this.phoneNumber,
    required this.prise,
    required this.deadline,
    required this.assignedMaster,
  });

  Order copyWith({
    String? customerName,
    String? phoneNumber,
    int? prise,
    DateTime? deadline,
    String? assignedMaster,
  }) {
    return Order(
      customerName: customerName ?? this.customerName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      prise: prise ?? this.prise,
      deadline: deadline ?? this.deadline,
      assignedMaster: assignedMaster ?? this.assignedMaster,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customerName': customerName,
      'phoneNumber': phoneNumber,
      'prise': prise,
      'deadline': deadline.millisecondsSinceEpoch,
      'assignedMaster': assignedMaster,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      customerName: map['customerName'] as String,
      phoneNumber: map['phoneNumber'] as String,
      prise: map['prise'] as int,
      deadline: DateTime.fromMillisecondsSinceEpoch(map['deadline'] as int),
      assignedMaster: map['assignedMaster'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // bool operator ==(covariant Order other) {
  //   if (identical(this, other)) return true;

  //   return other.customerName == customerName &&
  //       other.phoneNumber == phoneNumber &&
  //       other.prise == prise &&
  //       other.deadline == deadline &&
  //       other.assignedMaster == assignedMaster;
  // }
}
