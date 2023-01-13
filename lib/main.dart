import 'my_bottom_navigation.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyPokemonApp());
}

class MyPokemonApp extends StatelessWidget {
  const MyPokemonApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => PokemonService(),
        child: Consumer<PokemonService>(
          builder: (_, pokemonService, __) {
            return MaterialApp(
                title: 'Pokemon Demo',
                theme: ThemeData(
                    appBarTheme:
                        AppBarTheme(backgroundColor: pokemonService.themeColor),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                        selectedItemColor: pokemonService.themeColor)),
                home: const MyBottomNavigation());
          },
        ));
  }
}
