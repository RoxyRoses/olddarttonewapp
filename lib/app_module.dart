import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_app/home_module.dart';
import 'package:workshop_app/modules/searchhero/domain/usecases/search_hero.dart';
import 'package:workshop_app/modules/searchhero/infra/repositories/search_hero_repository_impl.dart';

import 'modules/searchhero/external/datasources/search_hero_datasouce_api.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => SearchHeroImpl(i())),
    Bind((i) => Dio()),
    Bind((i) => SearchHeroRepositoryImpl(i())),
    Bind((i) => SearchDatasourceApiImpl(i())),
  ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
      ];

  
}
