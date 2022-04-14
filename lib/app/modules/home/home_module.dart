import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/dota/dota_controller.dart';
import 'components/todo/todo_controller.dart';
import 'home_page.dart';
import 'repository/toda_repository.dart';
import 'services/todo_shared_service.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        $TodoSharedService,
        $TodoSharedService,
        //$TodoHiveService,
        //$TodoHiveService,
        Bind((i) => Dio()),
        $TodaRepository,
        $TodoController,
        $DotaController,
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
      ];
 }
