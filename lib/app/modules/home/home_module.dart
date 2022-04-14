import 'services/todo_shared_service.dart';
import 'components/todo/item/item_controller.dart';
import 'package:dio/dio.dart';
import 'repository/toda_repository.dart';
import 'components/todo/todo_controller.dart';
import 'components/dota/dota_controller.dart';
import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        $TodoSharedService,
        $TodoSharedService,
        //$TodoHiveService,
        //$TodoHiveService,
        $ItemController,
        Bind((i) => Dio()),
        $TodaRepository,
        $TodoController,
        $DotaController,
        $HomeController,
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
      ];
 }
