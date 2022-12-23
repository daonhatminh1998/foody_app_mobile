import 'package:foody_app/model/login_info/login_info.dart';
import 'package:foody_app/model/member/change_info.dart';
import 'package:foody_app/ultils/app_variables.dart';
import 'package:scoped_model/scoped_model.dart';

class ChangeInfoViewModel extends Model {
  Future<LoginInfo?> changeInfo(ChangeInfo changeInfo) async {
    var request = await AppVariables.api.changeInfo(changeInfo);
    // print(
    //     'errorCode: ${request.errorCode},message:${request.message},data:${request.data}');
    if (request.errorCode == 0) {
      return request.data;
    }
    return null;
  }
}
