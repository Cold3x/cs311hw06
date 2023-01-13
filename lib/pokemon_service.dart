import 'pokemon_api.dart';
import 'package:flutter/material.dart';

class PokemonService extends ChangeNotifier {
  int pokemonCount = 1;
  Color themeColor = Colors.blue;
  int currentPokemon = 0;

  /// The color map that maps Pokemon types with colors.
  static const Map<String, Color> _colorLists = {
    'normal': Color(0xFFA8A77A),
    'fire': Color(0xFFEE8130),
    'water': Color(0xFF6390F0),
    'electric': Color(0xFFF7D02C),
    'grass': Color(0xFF7AC74C),
    'ice': Color(0xFF96D9D6),
    'fighting': Color(0xFFC22E28),
    'poison': Color(0xFFA33EA1),
    'ground': Color(0xFFE2BF65),
    'flying': Color(0xFFA98FF3),
    'psychic': Color(0xFFF95587),
    'bug': Color(0xFFA6B91A),
    'rock': Color(0xFFB6A136),
    'ghost': Color(0xFF735797),
    'dragon': Color(0xFF6F35FC),
    'dark': Color(0xFF705746),
    'steel': Color(0xFFB7B7CE),
    'fairy': Color(0xFFD685AD),
  };

  void changePokemonCount(int value) {
    pokemonCount += value;
    if (pokemonCount < 0) {
      pokemonCount = 0;
    }
    notifyListeners();
  }

  /// Selects the Pokemon at [pokemonId].
  ///
  /// When Pokemon is selected, [themeColor] will be changed to Pokemon type's color.
  void selectPokemon(int pokemonId) async {
    PokemonInfo pokemonInfo = await fetchPokemonInfo(pokemonId);
    themeColor = _colorLists[pokemonInfo.types.first]!;
    currentPokemon = pokemonId;
    notifyListeners();
  }
}
