import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/features/pokemon/data/models/pokemon_model.dart';

abstract class PokemonsRemoteDataSources {
  Future<PokemonModel> getPokemon(int id);
}

class PokemonsRemoteDataSourcesImpl implements PokemonsRemoteDataSources {
  final Dio dio = Dio();

  @override
  Future<PokemonModel> getPokemon(int id) async {
    final resp = await dio.get('https://pokeapi.co/api/v2/pokemon/$id');
    return PokemonModel.fromJson(resp.data);
  }
}
