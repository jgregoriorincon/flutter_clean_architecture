import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/error/failures.dart';
import 'package:flutter_clean_architecture/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_clean_architecture/features/pokemon/domain/repositories/pokemons_repository.dart';

class SearchPokemonUseCase {
  final PokemonsRepository repository;

  SearchPokemonUseCase({required this.repository});

  Future<Either<Failure, Pokemon>> call(int id) {
    return repository.getPokemon(id);
  }
}
