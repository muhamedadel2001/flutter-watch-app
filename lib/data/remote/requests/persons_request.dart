import 'package:dio/dio.dart';
import 'package:movies_app/core/constants_methods.dart';
import 'package:movies_app/core/end_points.dart';
import 'package:movies_app/data/remote/data_providers/my_dio.dart';
import 'package:movies_app/data/remote/responses/persons_response.dart';

class PersonsRequest {
  Future personsRequest({required String apiKey}) async {
    try {
      Response response = await MyDio.getData(
          endPoint: popularPerson, query: {'api_key': apiKey});
      printTest('PersonsStatusCode${response.statusCode}');
      printResponse('PersonsResponse${response.data}');

      return PersonsResponse.fromJson(response.data);
    } catch (error) {
      printError('personsRequest$error');
    }
  }
}
