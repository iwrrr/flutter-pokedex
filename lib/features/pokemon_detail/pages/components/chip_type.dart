import 'package:flutter/material.dart';

class ChipType extends StatelessWidget {
  const ChipType({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text('{pokemon_type}'),
    );
  }
}
