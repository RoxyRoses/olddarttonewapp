import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workshop_app/modules/searchhero/domain/entities/hero_model.dart';
import 'package:workshop_app/modules/searchhero/infra/datasources/search_hero_datasource.dart';
import 'package:workshop_app/modules/searchhero/infra/models/hero_model_dto.dart';
import 'package:workshop_app/modules/searchhero/infra/repositories/search_hero_repository_impl.dart';

class SearchDatasourceMock extends Mock implements SearchHeroDatasource{}
main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchHeroRepositoryImpl(datasource);

  test("Should return a list of heroModel", (() async {
    when(() => datasource.getHero()).thenAnswer((_) async => <HeroModelDto>[]);
    final result = await repository.getHeroes();

    expect(result | [], isA<List<HeroModel>>());
  }));

  // test("Should return error if datasource fails", (() async {
  //   when(() => datasource.getHero()).thenThrow(Exception());
  //   final result = await repository.getHeroes();
  //   expect(result.fold(id, id), (r) => isA<DataSourceError>());
  // }));
}