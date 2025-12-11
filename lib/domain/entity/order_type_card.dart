import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderTypeCard {
  final String name;
  final String description;
  final int count;

  const OrderTypeCard({
    required this.name,
    this.description = '',
    this.count = 0,
  });

  OrderTypeCard copyWith({
    String? name,
    String? description,
    int? count,
  }) {
    return OrderTypeCard(
      name: name ?? this.name,
      description: description ?? this.description,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'count': count,
    };
  }

  factory OrderTypeCard.fromMap(Map<String, dynamic> map) {
    return OrderTypeCard(
      name: map['name'] as String,
      description: map['description'] as String,
      count: map['count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderTypeCard.fromJson(String source) =>
      OrderTypeCard.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OrderTypeCard(name: $name, description: $description, count: $count)';

  @override
  bool operator ==(covariant OrderTypeCard other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.count == count;
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ count.hashCode;
}
