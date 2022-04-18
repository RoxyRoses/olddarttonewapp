part of 'search_hero_bloc.dart';

@immutable
abstract class SearchHeroEvent {
  const SearchHeroEvent();
}

class SearchEvent extends SearchHeroEvent{
  
  const SearchEvent();
  List<Object> get props => [const SearchEvent()];
}
