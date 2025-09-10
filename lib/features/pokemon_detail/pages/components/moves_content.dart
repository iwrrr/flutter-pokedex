import 'package:flutter/material.dart';

class MovesContent extends StatelessWidget {
  const MovesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverFillRemaining(child: Center(child: Text('Coming soon'))),
      ],
    );
  }
}
