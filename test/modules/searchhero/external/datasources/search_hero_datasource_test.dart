import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workshop_app/modules/searchhero/external/datasources/search_hero_datasouce_api.dart';

import '../../utils/api_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasouce = SearchDatasourceApiImpl(dio);

  test('Should return a list of Heroes', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        data: jsonDecode(apiresponse), statusCode: 200, requestOptions: RequestOptions(path: '')));

        final future =  datasouce.getHero();

        expect(future, completes);
  });

}
