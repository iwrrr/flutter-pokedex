import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class AboutInfoItem extends StatelessWidget {
  const AboutInfoItem({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            label,
            style: TextTheme.of(
              context,
            ).labelLarge?.copyWith(color: Colors.grey),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(value, style: TextTheme.of(context).labelLarge),
        ),
      ],
    );
  }
}

class AboutInfoItemLoading extends StatelessWidget {
  const AboutInfoItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Expanded(
          flex: 1,
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
