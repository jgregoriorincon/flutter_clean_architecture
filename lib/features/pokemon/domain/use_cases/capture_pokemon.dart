import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/error/failures.dart';
import 'package:flutter_clean_architecture/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_clean_architecture/features/pokemon/domain/repositories/pokemons_repository.dart';

class CapturePokemonUseCase {
  final PokemonsRepository repository;

  CapturePokemonUseCase({required this.repository});

  Future<Either<Failure, bool>> call(Pokemon pokemon) {
    return repository.capturePokemon(pokemon);
  }
}
