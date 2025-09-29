import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: ConfirmOrderBody(),
    );
  }
}

class ConfirmOrderBody extends StatelessWidget {
  const ConfirmOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 4.0,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text('Дані клієнта',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              )),
          Row(
            children: [
              Text('data'),
              Text('data'),
            ],
          )
        ],
      ),
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
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 4.0,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          ...children
        ],
      ),
    );
  }
}

class RowBuildWidget extends StatelessWidget {
  final String? label;
  final Icon? icon;
  final String value;
  const RowBuildWidget({super.key, this.icon, this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(label ?? ''),
        ],
      ),
    );
  }
}
