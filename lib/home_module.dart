import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/modules/home/components/dota/dota_controller.dart';
import 'app/modules/home/components/todo/todo_controller.dart';
import 'app/modules/home/repository/toda_repository.dart';
import 'app/modules/home/services/todo_shared_service.dart';
import 'modules/searchhero/presenter/home_page.dart';

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
