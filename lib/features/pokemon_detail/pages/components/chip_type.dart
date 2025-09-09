import 'package:flutter/material.dart';

class ChipType extends StatelessWidget {
  final String type;

  const ChipType({required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(type),
    );
  }
}
