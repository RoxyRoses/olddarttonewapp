import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_app/app/shared/utils/constants.dart';
import 'package:workshop_app/modules/searchhero/infra/models/hero_model_dto.dart';

import '../../../../modules/searchhero/domain/entities/hero_model.dart';
import 'interfaces/toda_repository_interface.dart';

part 'toda_repository.g.dart';

@Injectable()
class TodaRepository implements ITodaRepository {
  final Dio client;

  TodaRepository(this.client);

  @override
  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future<List<HeroModel>> getHeros() async {
    var response = await client.get(urlbase);
    List<HeroModel> list = [];
    debugPrint(response.data.toString());
    for (var item in response.data as List) {
      HeroModelDto model = HeroModelDto.fromJson(item);
      list.add(model);
    }
    return list;
  }
}
