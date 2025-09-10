import 'package:flutter/material.dart';
import 'package:pokedex/resources/assets.gen.dart';

class PokeballBackground extends StatelessWidget {
  static const double _pokeballWidthFraction = 0.664;

  const PokeballBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.paddingOf(context).top;
    final pokeballSize =
        MediaQuery.sizeOf(context).width * _pokeballWidthFraction;
    final appBarHeight = AppBar().preferredSize.height;
    final iconSize = IconTheme.of(context).size ?? 0;

    final pokeballTopMargin =
        -(pokeballSize / 2 - safeAreaTop - appBarHeight / 2);
    final pokeballRightMargin = -(pokeballSize / 2 - 28 - iconSize / 2);

    return Positioned(
      top: pokeballTopMargin,
      right: pokeballRightMargin,
      child: Assets.images.pokeball.image(
        width: pokeballSize,
        height: pokeballSize,
        color: Color(0xFFF6F6F6),
      ),
    );
  }
}
