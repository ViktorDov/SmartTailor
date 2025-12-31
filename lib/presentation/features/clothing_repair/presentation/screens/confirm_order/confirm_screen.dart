import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_tailor/presentation/widgets/appbar.dart';

class ConfirmOrderScreen extends StatefulWidget {
  static final String path = '/confirmOrder';
  static final String name = 'confirmOrder';
  const ConfirmOrderScreen({super.key});

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Підтвердити замовлення',
        onPressed: () => context.pop(),
      ),
      body: const ConfirmOrderBody(),
    );
  }
}

class ConfirmOrderBody extends StatelessWidget {
  const ConfirmOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SectionBuildWidget(
          title: "Дані клієнта",
          children: [CustomerDataWidget()],
        ),
        SectionBuildWidget(
          title: "Деталі замовлення",
          children: [
            OrderDetailsWidget(),
          ],
        ),
        SectionBuildWidget(
          title: "Вартість",
          children: [
            OrderPriceWidget(),
          ],
        ),
      ],
    );
  }
}

class SectionBuildWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const SectionBuildWidget({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.white, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }
}

class CustomerDataWidget extends StatelessWidget {
  const CustomerDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: .all(8),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.person_2),
              SizedBox(width: 10),
              Text("Ім'я"),
              SizedBox(width: 10),
              Text('Іван Петренко'),
            ],
          ),
          Row(
            children: [
              Icon(Icons.phone),
              SizedBox(width: 10),
              Text("Телефон"),
              SizedBox(width: 10),
              Text('+380 067 123 45 67'),
            ],
          ),
          Row(
            children: [
              Icon(Icons.location_on),
              SizedBox(width: 10),
              Text("Ім'я"),
              SizedBox(width: 10),
              Text('Іван Петренко'),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.content_cut),
              SizedBox(width: 10),
              Text("Усунення дірки"),
            ],
          ),
          Row(
            children: [
              Icon(Icons.phone),
              SizedBox(width: 10),
              Text("Встановлення блискавки"),
            ],
          ),
          Text('Дедлайн   \${deadline}'),
          Text('Відповідальний майстер   \${tailorMaster}'),
        ],
      ),
    );
  }
}

class OrderPriceWidget extends StatelessWidget {
  const OrderPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(),
        ],
      ),
    );
  }
}
