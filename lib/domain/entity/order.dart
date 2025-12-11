// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:smart_tailor/domain/entity/order_type_card.dart';

class Order {
  final String customerName;
  final String customerSecondName;
  final List<OrderTypeCard> orderType;
  final int phoneNumber;
  final int prise;
  final DateTime deadline;
  final String assignedMaster;
  Order({
    required this.customerName,
    required this.customerSecondName,
    required this.orderType,
    required this.phoneNumber,
    required this.prise,
    required this.deadline,
    required this.assignedMaster,
  });

  factory Order.empty(List<OrderTypeCard> orderType) {
    return Order(
      customerName: 'customerName',
      customerSecondName: 'customerSecondName',
      orderType: orderType,
      phoneNumber: 1,
      prise: 1,
      deadline: DateTime.now(),
      assignedMaster: 'assignedMaster',
    );
  }

  Order copyWith({
    String? customerName,
    String? customerSecondName,
    List<OrderTypeCard>? orderType,
    int? phoneNumber,
    int? prise,
    DateTime? deadline,
    String? assignedMaster,
  }) {
    return Order(
      customerName: customerName ?? this.customerName,
      customerSecondName: customerSecondName ?? this.customerSecondName,
      orderType: orderType ?? this.orderType,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      prise: prise ?? this.prise,
      deadline: deadline ?? this.deadline,
      assignedMaster: assignedMaster ?? this.assignedMaster,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customerName': customerName,
      'customerSecondName': customerSecondName,
      'orderType': orderType.map((x) => x.toMap()).toList(),
      'phoneNumber': phoneNumber,
      'prise': prise,
      'deadline': deadline.millisecondsSinceEpoch,
      'assignedMaster': assignedMaster,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      customerName: map['customerName'] as String,
      customerSecondName: map['customerSecondName'] as String,
      orderType: List<OrderTypeCard>.from(
        (map['orderType'] as List<int>).map<OrderTypeCard>(
          (x) => OrderTypeCard.fromMap(x as Map<String, dynamic>),
        ),
      ),
      phoneNumber: map['phoneNumber'] as int,
      prise: map['prise'] as int,
      deadline: DateTime.fromMillisecondsSinceEpoch(map['deadline'] as int),
      assignedMaster: map['assignedMaster'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Order(customerName: $customerName, customerSecondName: $customerSecondName, orderType: $orderType, phoneNumber: $phoneNumber, prise: $prise, deadline: $deadline, assignedMaster: $assignedMaster)';
  }

  @override
  bool operator ==(covariant Order other) {
    if (identical(this, other)) return true;

    return other.customerName == customerName &&
        other.customerSecondName == customerSecondName &&
        listEquals(other.orderType, orderType) &&
        other.phoneNumber == phoneNumber &&
        other.prise == prise &&
        other.deadline == deadline &&
        other.assignedMaster == assignedMaster;
  }

  @override
  int get hashCode {
    return customerName.hashCode ^
        customerSecondName.hashCode ^
        orderType.hashCode ^
        phoneNumber.hashCode ^
        prise.hashCode ^
        deadline.hashCode ^
        assignedMaster.hashCode;
  }
}
