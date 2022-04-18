import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:workshop_app/modules/searchhero/domain/entities/hero_model.dart';

import '../../../domain/usecases/search_hero.dart';

part 'search_hero_event.dart';
part 'search_hero_state.dart';

class SearchHeroBloc extends Bloc<SearchHeroEvent, SearchHeroState> {
  final SearchHero usecase;

  SearchHeroBloc(this.usecase) : super(SearchHeroInitial()) {
    on<SearchEvent>((event, emit) async {
      emit(LoadSearchState());
      final result = await usecase.getHeroes();
      result.fold((l) {
        emit(ErrorSearchState(message: "something went wrong"));
      }, (r) {
        emit(SuccessSearchState(r));
      });
    });
  }
}
