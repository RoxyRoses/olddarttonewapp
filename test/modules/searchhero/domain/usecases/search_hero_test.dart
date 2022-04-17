import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workshop_app/modules/searchhero/domain/entities/hero_model.dart';
import 'package:workshop_app/modules/searchhero/domain/repositories/search_hero_repository.dart';
import 'package:workshop_app/modules/searchhero/domain/usecases/search_hero.dart';

class HeroRepositoryMock extends Mock implements SearchHeroRepository{}

main() {
  
  final repository = HeroRepositoryMock();
  final usecase = SearchHeroImpl(repository);

  test('Should Return a hero', () async{
    when(() => repository.getHeroes()).thenAnswer((_) async => right(<HeroModel>[]));
    final result = await usecase.getHeroes();
    expect(result | [], isA<List<HeroModel>>());
  });

  // test('Should Return a exception if null', () async{
  //   when(() => repository.getHeros()).thenAnswer((_) async => right(<HeroModel>[]));
  //   final result = await usecase.getHeros();
  //   expect(result.fold(id, id), (r) => isA<InvalidListError>());
  // });
}