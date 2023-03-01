import 'package:flutter/material.dart';

class ImcCard extends StatelessWidget {
  const ImcCard(
      {required this.value, required this.label, this.width, Key? key})
      : super(key: key);

  final String value;
  final String label;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.redAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.red[800]!),
          ),
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.grey[800]!),
          ),
        ],
      ),
    );
  }
}
