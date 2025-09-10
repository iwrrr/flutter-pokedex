import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class StatInfoItem extends StatelessWidget {
  const StatInfoItem({super.key, required this.label, required this.value});

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextTheme.of(
                    context,
                  ).labelLarge?.copyWith(color: Colors.grey),
                ),
              ),
              Text(
                value.toStringAsFixed(0),
                style: TextTheme.of(
                  context,
                ).labelLarge?.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Builder(
            builder: (context) {
              final valueColor = value > 50 ? Colors.green : Colors.red;
              return LinearProgressIndicator(
                value: value / 100,
                valueColor: AlwaysStoppedAnimation(valueColor),
                borderRadius: BorderRadius.circular(10),
                backgroundColor: Colors.grey.shade100,
              );
            },
          ),
        ),
      ],
    );
  }
}

class StatInfoItemLoading extends StatelessWidget {
  const StatInfoItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Expanded(
          flex: 2,
          child: FadeShimmer(
            height: 14,
            width: double.infinity,
            radius: 8,
            fadeTheme: FadeTheme.light,
          ),
        ),
        Expanded(
          flex: 3,
          child: FadeShimmer(
            height: 14,
            width: double.infinity,
            radius: 8,
            fadeTheme: FadeTheme.light,
          ),
        ),
      ],
    );
  }
}
