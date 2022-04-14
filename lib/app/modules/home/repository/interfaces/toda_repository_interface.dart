import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../modules/searchhero/domain/entities/hero_model.dart';

abstract class ITodaRepository implements Disposable {
  Future fetchPost();
  Future<List<HeroModel>> getHeros();
}
