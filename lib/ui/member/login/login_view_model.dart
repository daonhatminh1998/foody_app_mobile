import 'package:foody_app/model/login_info/login_info.dart';
import 'package:foody_app/model/member/login_request.dart';

import 'package:foody_app/ultils/app_variables.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginViewModel extends Model {
  Future<LoginInfo?> login(String username, String password) async {
    var request = await AppVariables.api
        .doLogin(LoginRequest(username: username, password: password));
    print(
        'errorCode: ${request.errorCode},message:${request.message},data:${request.data}');
    if (request.errorCode == 0) {
      return request.data;
    }
    return null;
  }
}
