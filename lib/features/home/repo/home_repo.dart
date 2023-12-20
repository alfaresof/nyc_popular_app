import 'package:nyc_popular_app/common/network/api_client.dart';
import 'package:nyc_popular_app/common/network/endpoints.dart';
import 'package:nyc_popular_app/common/network/network_exception.dart';
import 'package:nyc_popular_app/common/service/get_it.dart';
import 'package:nyc_popular_app/features/home/models/result_model.dart';

import '../../../common/network/api_result.dart';

class HomeApi {
  final networkLocater = getIt
      .get<DioClient>()
      .dio;

  Future<ApiResult<ResultModel>> getNyc(int period) async {
    try {
      final res = await networkLocater.get(Endpoints.getMostPopular(period));
      if (res.statusCode == 200) {
        final data = ResultModel.fromJson(res.data);
        return ApiResult.success(data: data);
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(res.statusCode));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
