import 'dart:developer';

import 'package:flutter_clean_architecture/core/error/failures.dart';
import 'package:flutter_clean_architecture/features/pokemon/data/models/pokemon_model.dart';
import 'package:flutter_clean_architecture/features/pokemon/domain/entities/pokemon.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class PokemonsLocalDataSource {
  Future<bool> capturePokemon(Pokemon pokemon);
  Future<List<PokemonModel>> getCapturePokemonsList();
}

class HivePokemonLocalDataSourceImpl implements PokemonsLocalDataSource {
  HivePokemonLocalDataSourceImpl() {
    Hive.initFlutter();
  }

  @override
  Future<bool> capturePokemon(Pokemon pokemon) async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');

      box.put(pokemon.id, PokemonModel.fromEntity(pokemon).toJson());
      return true;
    } catch (error) {
      log(error.toString());
      throw LocalFailure();
    }
  }

  @override
  Future<List<PokemonModel>> getCapturePokemonsList() async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');

      return box.values.map((p) => PokemonModel.fromJson(p)).toList();
    } catch (error) {
      log(error.toString());
      throw LocalFailure();
    }
  }
}
