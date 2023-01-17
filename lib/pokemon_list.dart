import 'pokemon_api.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonService>(builder: (_, pokemonService, __) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon List'),
        ),
        body: GridView.builder(
          itemCount: pokemonService.pokemonCount,
          itemBuilder: (BuildContext context, int index) {
            return PokemonCard(
              index: index,
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
        ),
      );
    });
  }
}

/// --------------------------------------------------------------------------------
/// PokemonCard
/// --------------------------------------------------------------------------------
///
/// The PokemonCard is a stateless widget that requires [index] to call [selectPokemon]
/// from [PokemonService] for displaying a Pokemon image
/// that will have a border and change the theme colors to this Pokemon type's color
/// when this widget was tapped.
class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    /// The Pokemon's id, where started with `1`.
    int pokemonId = index + 1;
    return Consumer<PokemonService>(builder: (_, pokemonService, __) {
      return GestureDetector(
          onTap: () => pokemonService.selectPokemon(pokemonId),
          child: Container(
              // Checks that the currently selected Pokemon's id is equal to this Pokemon's id.
              decoration: pokemonService.currentPokemon == pokemonId
                  ? BoxDecoration(border: Border.all(width: 3))
                  : const BoxDecoration(),
              child: Image.network(genPokemonImageUrl(pokemonId))));
    });
  }
}
