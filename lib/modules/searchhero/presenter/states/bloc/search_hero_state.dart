part of 'search_hero_bloc.dart';

@immutable
abstract class SearchHeroState {}

class SearchHeroInitial extends SearchHeroState {
  @override
  List<Object> get props => [];
}

class StartSearchState extends SearchHeroState{
  @override
  List<Object>? get props => null;
}

class LoadSearchState extends SearchHeroState{
  @override
  List<Object>? get props => null;
}

class SuccessSearchState extends SearchHeroState{
final List<HeroModel> result;

 SuccessSearchState(this.result);

  @override
  List<Object>? get props => [result];
}

class ErrorSearchState extends SearchHeroState{
  final String message;

   ErrorSearchState({this.message = ''});

  @override
  List<Object> get props => [message];

}
