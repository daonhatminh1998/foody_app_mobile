// ignore_for_file: non_constant_identifier_names

import 'package:foody_app/model/receiver/receiver.dart';
import 'package:foody_app/ui/receiver/receiver_screen.dart';
import 'package:foody_app/ui/receiver/receiver_view_model.dart';

import 'package:foody_app/ultils/app_variables.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:scoped_model/scoped_model.dart';

class UpdateReceiver extends StatefulWidget {
  final Receiver receiver;
  const UpdateReceiver({super.key, required this.receiver});

  @override
  State<UpdateReceiver> createState() => _UpdateReceiverState();
}

class _UpdateReceiverState extends State<UpdateReceiver> {
  final _formKey = GlobalKey<FormBuilderState>();
  final receiverViewModel = ReceiverViewModel();

  // Future<void> _deleteReceiver(var context, ReceiverViewModel model) async {
  //   print("Delete Receiver (screen)");
  //   print(widget.receiver.toJson());
  //   model.delete(widget.receiver);

  //   Navigator.pop(context,
  //       MaterialPageRoute(builder: (context) => const ReceiverScreen()));
  // }

  Future<void> _updateReceiver(var context, receiverViewModel) async {
    print("Update Receiver (screen)");
    final curState = _formKey.currentState!;
    curState.save();
    if (curState.validate()) {
      // print(curState.value);
      print(widget.receiver.toJson());

      final formValues = curState.value;
      final receiver = Receiver(
        Re_Id: widget.receiver.Re_Id,
        fullName: formValues['fullName'].toString(),
        phone: formValues['phone'].toString(),
        address: formValues['address'].toString(),
        Mem_Id: AppVariables.userInfo!.id,
        is_Default: formValues['is_Default'] == true ? 1 : 0,
      );
      print(receiver.toJson());
      receiverViewModel.save(receiver);

      Navigator.pop(context,
          MaterialPageRoute(builder: (context) => const ReceiverScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: receiverViewModel,
      child: Scaffold(
        appBar: AppBar(title: const Text("Update Receiver")),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "fullName",
                      keyboardType: TextInputType.text,
                      initialValue: widget.receiver.fullName,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "fullName"),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FormBuilderTextField(
                      name: "phone",
                      keyboardType: TextInputType.number,
                      initialValue: widget.receiver.phone,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "phone"),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FormBuilderTextField(
                      name: "address",
                      keyboardType: TextInputType.text,
                      initialValue: widget.receiver.address,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "address"),
                    ),
                    FormBuilderSwitch(
                      title: const Text("Default"),
                      name: "is_Default",
                      initialValue:
                          widget.receiver.is_Default == 1 ? true : false,
                      controlAffinity: ListTileControlAffinity.leading,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    InkWell(
                      child: Card(
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height * 0.05,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Delete receiver',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.red[500]),
                                ),
                              ],
                            )),
                      ),
                      onTap: () {
                        receiverViewModel.delete(widget.receiver);

                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ReceiverScreen()));
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                child: Card(
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      height: MediaQuery.of(context).size.height * 0.06,
                      color: Colors.red[600],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Update',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      )),
                ),
                onTap: () => _updateReceiver(context, receiverViewModel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
