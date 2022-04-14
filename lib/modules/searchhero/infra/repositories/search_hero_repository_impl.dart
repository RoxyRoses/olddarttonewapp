import 'package:dartz/dartz.dart';
import 'package:workshop_app/modules/searchhero/domain/entities/hero_model.dart';
import 'package:workshop_app/modules/searchhero/domain/errors/errors.dart';
import 'package:workshop_app/modules/searchhero/infra/datasources/search_hero_datasource.dart';

import '../../domain/repositories/search_hero_repository.dart';

class SearchHeroRepositoryImpl implements SearchHeroRepository {
  final SearchHeroDatasource datasource;

  SearchHeroRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureSearch, List<HeroModel>>> getHeroes() async {
    try {
      final result = await datasource.getHero();

      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
