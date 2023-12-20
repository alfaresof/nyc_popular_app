import 'package:get_it/get_it.dart';
import 'package:nyc_popular_app/common/network/api_client.dart';

import '../../features/home/repo/home_repo.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<DioClient>(DioClient());
  getIt.registerSingleton<HomeApi>(HomeApi());
}
