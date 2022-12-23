import 'package:foody_app/model/member/change_password.dart';
import 'package:foody_app/ultils/app_variables.dart';
import 'package:scoped_model/scoped_model.dart';

class ChangePasswordViewModel extends Model {
  Future<bool?> changePassword(
      String password, String newPassword, String confirmPassword) async {
    var request = await AppVariables.api.changePassword(ChangePassword(
        password: password,
        newPassword: newPassword,
        confirmPassword: confirmPassword));

    if (request.errorCode == 0) {
      return true;
    }
    return false;
  }
}
