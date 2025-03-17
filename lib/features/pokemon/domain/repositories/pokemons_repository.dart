import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/error/failures.dart';
import 'package:flutter_clean_architecture/features/pokemon/domain/entities/pokemon.dart';

abstract class PokemonsRepository {
  Future<Either<Failure, Pokemon>> getPokemon(int id);
  Future<Either<Failure, bool>> capturePokemon(Pokemon pokemon);
  Future<Either<Failure, List<Pokemon>>> getCapturePokemons();
}
