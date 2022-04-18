import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:workshop_app/app_module.dart';
import 'package:workshop_app/modules/searchhero/domain/entities/hero_model.dart';
import 'package:workshop_app/modules/searchhero/domain/usecases/search_hero.dart';
import 'package:workshop_app/modules/searchhero/external/datasources/search_hero_datasouce_api.dart';

import 'modules/searchhero/utils/api_response.dart';

class DioMock extends Mock implements Dio {}

class SearchHeroMock extends Mock implements SearchHeroImpl {}

class SearchDatasourceMock extends Mock implements SearchDatasourceApiImpl {}

main() {
  final dioMock = DioMock();
  final searchMock = SearchHeroMock();
  final searchDatasource = SearchDatasourceApiImpl(Dio());
  

  setUp((() { 
    initModule(AppModule(), replaceBinds: [
      Bind.instance<Dio>(dioMock),
      Bind.instance<SearchHeroImpl>(searchMock),
      Bind.instance<SearchHeroImpl>(searchMock),
      Bind.instance<SearchDatasourceApiImpl>(searchDatasource)
    ]);
  }));

  test('Should recover dio without error', (() {
    final dio = Modular.get<Dio>();
    expect(dio, isA<Dio>());
  }));

  test('Should recover usecase without error', (() {
    final usecase = Modular.get<SearchHero>();
    expect(usecase, isA<SearchHero>());
  }));

   test('Should recover a list of heroes', (() async {
    when(() => dioMock.get(any())).thenAnswer((_) async => Response(
        data: jsonDecode(apiresponse), statusCode: 200, requestOptions: RequestOptions(path: '')));

    final usecase = Modular.get<SearchHero>();
    final result = await usecase.getHeroes();
    expect(result | [], isA<List<HeroModel>>());
  }));
}
