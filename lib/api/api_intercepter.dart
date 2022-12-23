import 'package:dio/dio.dart';
import 'package:foody_app/ultils/app_variables.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (AppVariables.userInfo != null) {
      options.headers['Authorization'] =
          'Bearer ${AppVariables.userInfo!.token}';
    }
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }
}
