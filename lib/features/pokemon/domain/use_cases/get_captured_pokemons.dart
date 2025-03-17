import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/error/failures.dart';
import 'package:flutter_clean_architecture/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_clean_architecture/features/pokemon/domain/repositories/pokemons_repository.dart';

class GetCapturedsPokemonsUseCase {
  final PokemonsRepository repository;

  GetCapturedsPokemonsUseCase(this.repository);

  Future<Either<Failure, List<Pokemon>>> call() async {
    return await repository.getCapturePokemons();
  }
}
