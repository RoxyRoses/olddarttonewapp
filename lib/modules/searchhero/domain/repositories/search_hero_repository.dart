import 'package:dartz/dartz.dart';

import '../entities/hero_model.dart';
import '../errors/errors.dart';

abstract class SearchHeroRepository {
  Future<Either<FailureSearch, List<HeroModel>>> getHeroes();
}
