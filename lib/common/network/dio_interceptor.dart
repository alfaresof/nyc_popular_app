import 'package:dio/dio.dart';

class DioInterceptor extends QueuedInterceptor {
  final Dio dio;

  // final credentialsPref = getIt.get<CredentialRepository>();

  DioInterceptor(this.dio);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // final cachedAuth = await credentialsPref.getAuthState();
    // // print('token : $cachedAuth');
    // if (cachedAuth.isEmpty) {
    //   debugPrint('sign out here');
    //   credentialsPref.signOut();
    //   return;
    // }
    // final authState = TokenInfo.fromJson({
    //   'data': {'token': cachedAuth}
    // });

    // var token = authState.data!.token;
    options.headers['Accept'] = "application/json";
    options.headers['ContentType'] = "application/json";
    options.headers['contentType'] = "application/json";
    // options.baseUrl = AppEnvironment.baseUrl;
    // options.baseUrl = Endpoints.baseURL;
    // options.baseUrl = 'https://hwx9st40-6000.euw.devtunnels.ms/';
    // options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // if (err.error == const NetworkExceptions.unauthorisedRequest()) {
    //   credentialsPref.signOut();
    //   return;
    // }
    super.onError(err, handler);
  }
}
