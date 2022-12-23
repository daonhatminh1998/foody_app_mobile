import 'package:foody_app/api/api.dart';
import 'package:foody_app/api/api_intercepter.dart';

import 'package:foody_app/model/login_info/login_info.dart';
import 'package:dio/dio.dart';

class AppVariables {
  static LoginInfo? userInfo;

  static late ApiClient api;

  static void init() {
    final dio = Dio();
    dio.options.contentType = 'application/json;charset=utf-8';
    dio.interceptors.add(ApiInterceptor());
    api = ApiClient(dio);
  }
}
