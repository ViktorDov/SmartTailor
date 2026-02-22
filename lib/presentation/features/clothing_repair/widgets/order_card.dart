import 'package:flutter/material.dart';

import '../../../../domain/entity/order_type_card.dart';
import '../../../common/theme/app_colors.dart';

class OrderTypeCardWidget extends StatelessWidget {
  final OrderTypeCard order;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const OrderTypeCardWidget({
    super.key,
    required this.order,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = order.count > 0;
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.blueSelectedColor : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? AppColors.blueSelectedColor : Colors.white,
        ),
      ),
      child: ListTile(
        title: Text(
          order.name,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          order.description,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 13,
            color: isSelected ? Colors.black : Colors.black,
          ),
        ),
        trailing: Row(
          mainAxisSize: .min,
          children: [
            _CountButton(
              icon: Icons.remove,
              onPress: onDecrement,
              enabled: isSelected,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '${order.count}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _CountButton(
              icon: Icons.add,
              onPress: onIncrement,
            ),
          ],
        ),
      ),
    );
  }
}

class _CountButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;
  final bool enabled;
  const _CountButton({
    required this.icon,
    required this.onPress,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onPress : null,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: enabled ? Colors.blue : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 18,
          color: enabled ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
