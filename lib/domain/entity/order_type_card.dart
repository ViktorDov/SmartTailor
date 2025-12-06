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
}
