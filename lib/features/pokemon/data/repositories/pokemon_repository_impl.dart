import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/error/failures.dart';
import 'package:flutter_clean_architecture/features/pokemon/data/datasources/pokemons_local_data_source.dart';
import 'package:flutter_clean_architecture/features/pokemon/data/datasources/pokemons_remote_data_sources.dart';
import 'package:flutter_clean_architecture/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_clean_architecture/features/pokemon/domain/repositories/pokemons_repository.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsLocalDataSource pokemonLocalDataSource;
  final PokemonsRemoteDataSources pokemonsRemoteDataSources;

  PokemonsRepositoryImpl({
    required this.pokemonLocalDataSource,
    required this.pokemonsRemoteDataSources,
  });

  @override
  Future<Either<Failure, bool>> capturePokemon(Pokemon pokemon) async {
    try {
      final bool resp = await pokemonLocalDataSource.capturePokemon(pokemon);
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getCapturePokemons() async {
    try {
      final List<Pokemon> resp =
          await pokemonLocalDataSource.getCapturePokemonsList();
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemon(int id) async {
    try {
      final Pokemon resp = await pokemonsRemoteDataSources.getPokemon(id);
      return Right(resp);
    } on DioException {
      return Left(ServerFailure());
    }
  }
}
