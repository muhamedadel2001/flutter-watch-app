import 'package:dio/dio.dart';
import 'package:movies_app/core/end_points.dart';
import 'package:movies_app/data/remote/data_providers/my_dio.dart';
import 'package:movies_app/data/remote/responses/tv_shows_response.dart';

import '../../../core/constants_methods.dart';

class TvRequest {
  Future tvRequest({required String apiKey}) async {
    try {
      Response response =
          await MyDio.getData(endPoint: popularTv, query: {'api_key': apiKey});
      printTest('moviesRequestsStatusCode${response.statusCode}');
      printResponse('moviesResponse${response.data}');
      return TvShowsResponse.fromJson(response.data);
    } catch (error) {
      printError('tvRequest$error');
    }
  }
}
