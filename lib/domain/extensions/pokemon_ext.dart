import 'package:pokedex/domain/models/pokemon.dart';

extension PokemonExt on Pokemon {
  String get id => url.split("/").sublist(0, url.split("/").length - 1).last;

  String get number => switch (id.length) {
    1 => "00$id",
    2 => "0$id",
    _ => id,
  };

  String get imageUrl =>
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
}
