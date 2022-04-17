import 'package:workshop_app/modules/searchhero/domain/entities/hero_model.dart';

abstract class SearchHeroDatasource{
  Future<List<HeroModel>> getHero();
}