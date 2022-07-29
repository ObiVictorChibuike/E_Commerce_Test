import 'package:dio/dio.dart';
import '../../cached_data/cached_data.dart';
import 'dio_intercepter.dart';

class DioClient {
  DioClient() : dio = Dio(
    BaseOptions(
      baseUrl: 'https://westmarket.herokuapp.com',
      connectTimeout: 60000,
      receiveTimeout: 60000,
      sendTimeout: 60000,
      responseType: ResponseType.json,
    ),
  )..interceptors.addAll([
    AuthorizationInterceptor(),
    LoggerInterceptor(),
  ]);

  late final Dio dio;
}

class AuthorizationInterceptor extends Interceptor {
  CachedData cachedData = CachedData();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    String? token = await cachedData.getAuthToken();
    if (token != null && token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    }
    options.headers["Accept"] = "application/json";
    options.headers["Content-Type"] = "application/json";
    super.onRequest(options, handler);
  }

}