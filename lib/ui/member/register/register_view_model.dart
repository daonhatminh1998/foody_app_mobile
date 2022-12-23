import 'package:foody_app/model/member/register_request.dart';

import 'package:foody_app/ultils/app_variables.dart';
import 'package:scoped_model/scoped_model.dart';

class RegisterViewModel extends Model {
  Future<bool?> register(String username, String name, String email,
      String password, String confirmPassword) async {
    var request = await AppVariables.api.register(RegisterRequest(
        username: username,
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword));
    print(
        'errorCode: ${request.errorCode},message:${request.message},data:${request.data}');
    if (request.errorCode == 0) {
      return true;
    }
    return false;
  }
}
