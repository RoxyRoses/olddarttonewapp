import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workshop_app/modules/searchhero/domain/entities/hero_model.dart';
import 'package:workshop_app/modules/searchhero/domain/errors/errors.dart';
import 'package:workshop_app/modules/searchhero/domain/usecases/search_hero.dart';
import 'package:workshop_app/modules/searchhero/presenter/states/bloc/search_hero_bloc.dart';

class UsecaseMock extends Mock implements SearchHero{}

main(){
  final usecase = UsecaseMock();
  final bloc = SearchHeroBloc(usecase);

  blocTest<SearchHeroBloc, SearchHeroState>(
    'Should return the states in correct order',
    build: () {
          when(() => usecase.getHeroes()).thenAnswer((_) async =>    Right(<HeroModel>[HeroModel()]));

      return bloc;
    },
    act: (bloc) => bloc.add(const SearchEvent()),
    expect: () => [isA<LoadSearchState>(), isA<SuccessSearchState>()],
  );

  blocTest<SearchHeroBloc, SearchHeroState>(
    'Should return error',
    build: () {
          when(() => usecase.getHeroes(),).thenAnswer((invocation) async => Left(DataSourceError()));

      return SearchHeroBloc(usecase);
    },
    act: (bloc) => bloc.add(const SearchEvent()),
    expect: () => [isA<LoadSearchState>(), isA<ErrorSearchState>()],
  );
}