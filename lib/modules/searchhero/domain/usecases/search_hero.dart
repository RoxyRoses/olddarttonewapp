import 'package:dartz/dartz.dart';
import 'package:workshop_app/modules/searchhero/domain/repositories/search_hero_repository.dart';

import '../entities/hero_model.dart';
import '../errors/errors.dart';

abstract class SearchHero{
 Future<Either<FailureSearch, List<HeroModel>>> getHeros();
}

class SearchHeroImpl implements SearchHero{
  final SearchHeroRepository repository;

  SearchHeroImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<HeroModel>>> getHeros() async {
    
    var result = repository.getHeroes();

     if(result == null){
       return Left(InvalidListError());
     }
    
    return result;
  }
   
}