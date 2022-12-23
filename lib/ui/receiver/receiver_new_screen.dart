// ignore_for_file: non_constant_identifier_names

import 'package:foody_app/model/receiver/receiver.dart';
import 'package:foody_app/ui/order/order_screen.dart';
import 'package:foody_app/ui/receiver/receiver_screen.dart';
import 'package:foody_app/ui/receiver/receiver_view_model.dart';

import 'package:foody_app/ultils/app_variables.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:scoped_model/scoped_model.dart';

class NewReceiver extends StatefulWidget {
  const NewReceiver({super.key});

  @override
  State<NewReceiver> createState() => _NewReceiverState();
}

class _NewReceiverState extends State<NewReceiver> {
  final _formKey = GlobalKey<FormBuilderState>();
  final receiverViewModel = ReceiverViewModel();

  void _newReceiver(var context, ReceiverViewModel model) async {
    print("New Receiver (screen)");
    final curState = _formKey.currentState!;
    curState.save();
    if (curState.validate()) {
      final formValues = curState.value;

      final receiver = Receiver(
        fullName: formValues['fullName'].toString(),
        phone: formValues['phone'].toString(),
        address: formValues['address'].toString(),
        Mem_Id: AppVariables.userInfo!.id,
        is_Default: formValues['is_Default'] == true ? 1 : 0,
      );
      model.save(receiver);

      Navigator.pop(context,
          MaterialPageRoute(builder: (context) => const ReceiverScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: receiverViewModel,
      child: Scaffold(
        appBar: AppBar(title: const Text("New Receiver")),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FormBuilder(
                key: _formKey,
                child: Column(children: [
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: "fullName",
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "fullName"),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FormBuilderTextField(
                    name: "phone",
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "phone"),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
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
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "address"),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  FormBuilderSwitch(
                    title: const Text("Default"),
                    name: "is_Default",
                    controlAffinity: ListTileControlAffinity.leading,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ]),
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
                            'Save',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      )),
                ),
                onTap: () => _newReceiver(context, receiverViewModel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
