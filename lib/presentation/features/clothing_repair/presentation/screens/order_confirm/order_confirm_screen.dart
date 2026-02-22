import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_tailor/presentation/common/extentions/date_time_extensions.dart';
import 'package:smart_tailor/presentation/features/clothing_repair/presentation/screens/order_confirm/cubit/order_confirm_cubit.dart';

import 'package:smart_tailor/presentation/widgets/appbar.dart';

import '../../../../../../domain/entity/order.dart';

class OrderConfirmationScreen extends StatefulWidget {
  final Order orderInfo;
  static final String path = 'confirm';
  static final String name = 'confirmOrder';
  const OrderConfirmationScreen({
    super.key,
    required this.orderInfo,
  });

  @override
  State<OrderConfirmationScreen> createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderConfirmationCubit(widget.orderInfo),
      child: Scaffold(
        appBar: CustomAppBarWidget(
          title: 'Підтвердити замовлення',
          onLeadingButtonPress: () => context.pop(),
        ),
        body: const OrderConfirmationBody(),
      ),
    );
  }
}

class OrderConfirmationBody extends StatelessWidget {
  const OrderConfirmationBody({super.key});

  @override
  Widget build(BuildContext context) {
    final order = context.read<OrderConfirmationCubit>().state.order;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: .center,
        spacing: 12,
        children: [
          _SectionBuildWidget(
            title: "Дані клієнта",
            children: [
              CustomerDataWidget(order: order),
            ],
          ),
          _SectionBuildWidget(
            title: "Деталі замовлення",
            children: [
              OrderDetails(order: order),
            ],
          ),
          _SectionBuildWidget(
            title: "Вартість",
            children: [
              OrderPrice(order: order),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionBuildWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SectionBuildWidget({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 5, right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

class CustomerDataWidget extends StatelessWidget {
  final Order order;
  const CustomerDataWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final name = "${order.customerName} ${order.customerMiddleName}";
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          InfoRow(
            icon: Icons.person,
            label: "Ім'я",
            value: name,
          ),
          InfoRow(
            icon: Icons.phone,
            label: "Телефон",
            value: order.phoneNumber.toString(),
          ),
          const InfoRow(
            icon: Icons.location_on,
            label: "Локація",
            value: "вул. Станційна 1a",
          ),
        ],
      ),
    );
  }
}

class OrderDetails extends StatelessWidget {
  final Order order;
  const OrderDetails({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...order.orderType.map(
            (type) => InfoRow(
              icon: Icons.content_cut,
              value: type.name,
            ),
          ),
          InfoRow(
            icon: Icons.tips_and_updates,
            label: 'Дедлайн',
            value: order.deadline.ddMMyyyy,
          ),
          InfoRow(
            icon: Icons.work_history_outlined,
            label: 'Майстер',
            value: order.assignedMaster,
          ),
        ],
      ),
    );
  }
}

class OrderPrice extends StatelessWidget {
  final Order order;
  const OrderPrice({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Попередня вартість',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: Colors.blue.shade500,
                ),
              ),
              const Spacer(),
              Text(
                order.prise.toString(),
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String? label;
  final String value;

  const InfoRow({
    super.key,
    required this.icon,
    this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        spacing: 12,
        children: [
          Icon(icon, size: 22, color: Colors.blue.shade400),
          Text(
            label ?? '',
            style: GoogleFonts.inter(
              fontSize: 15,
              color: Colors.blue.shade500,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
