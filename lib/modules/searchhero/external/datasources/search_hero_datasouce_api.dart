import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:workshop_app/modules/searchhero/infra/models/hero_model_dto.dart';

import '../../domain/entities/hero_model.dart';
import '../../domain/errors/errors.dart';
import '../../infra/datasources/search_hero_datasource.dart';

class SearchDatasourceApiImpl implements SearchHeroDatasource {
  final Dio dio;

  SearchDatasourceApiImpl(this.dio);

  @override
  Future<List<HeroModel>> getHero() async {
    final response = await dio.get("https://api.opendota.com/api/heroStats");

    if (response.statusCode == 200) {
      List<HeroModel> list = [];
      debugPrint(response.data.toString());
      for (var item in response.data) {
        HeroModelDto model = HeroModelDto.fromJson(item);
        list.add(model);
      }

      return list;
    } else {
      throw DataSourceError();
    }
  }
}
