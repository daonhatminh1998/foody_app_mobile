import 'package:foody_app/model/receiver/receiver.dart';
import 'package:foody_app/ultils/app_variables.dart';
import 'package:scoped_model/scoped_model.dart';

class ReceiverViewModel extends Model {
  static final ReceiverViewModel _instance = ReceiverViewModel._internal();
  factory ReceiverViewModel() => _instance;

  List<Receiver> receivers = [];

  ReceiverViewModel._internal() {
    updateList();
  }

  Future<void> updateList() async {
    final rs = await AppVariables.api.listReceiver();

    receivers = rs.data ?? [];
    //  print('errorCode: ${rs.errorCode},message:${rs.message},data:${rs.data!.toJson()}');
    notifyListeners();
  }

  void save(Receiver receiver) async {
    receiver.Re_Id == 0
        ? await AppVariables.api.newReceiver(receiver)
        : await AppVariables.api.updateReceiver(receiver.Re_Id, receiver);
  }

  void delete(Receiver receiver) async {
    await AppVariables.api.deleteReceiver(receiver.Re_Id);
    updateList();
  }

  Future<void> select(Receiver receiver) async {
    await AppVariables.api.select(receiver);
    // print(receiver.Re_Id);
    // print(
    //     'errorCode: ${rs.errorCode},message:${rs.message},data:${rs.data?.toJson()}');
    updateList();
  }

  Future<void> reset() async {
    await AppVariables.api.reset();
    updateList();
  }
}
