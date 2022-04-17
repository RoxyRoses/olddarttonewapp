import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workshop_app/modules/searchhero/domain/errors/errors.dart';
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

   test('Should return a error if code its not 200', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        data: null, statusCode: 401, requestOptions: RequestOptions(path: '')));

        final future =  datasouce.getHero();

        expect(future, throwsA(isA<DataSourceError>()));
  });

  test('Should return a exception if error on dio ', () async {
    when(() => dio.get(any())).thenThrow(Exception());

        final future =  datasouce.getHero();

        expect(future, throwsA(isA<Exception>()));
  });

}
