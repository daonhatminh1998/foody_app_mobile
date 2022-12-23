import 'package:foody_app/components/background-image.dart';
import 'package:foody_app/components/navigation_bar.dart';
import 'package:foody_app/model/member/change_info.dart';
import 'package:foody_app/ui/member/change_info/change_info_view_model.dart';

import 'package:foody_app/ultils/app_variables.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:scoped_model/scoped_model.dart';

class ChangeInfoScreen extends StatefulWidget {
  const ChangeInfoScreen({super.key});

  @override
  State<ChangeInfoScreen> createState() => _ChangeInfoScreenState();
}

class _ChangeInfoScreenState extends State<ChangeInfoScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final changeInfoViewModel = ChangeInfoViewModel();

  Future<void> _changeInfo(var context, ChangeInfoViewModel model) async {
    print("change Infor (screen)");
    final curState = _formKey.currentState!;
    curState.save();
    if (curState.validate()) {
      print(curState.value);
      final formValues = curState.value;
      final changInfo =
          ChangeInfo(name: formValues['name'], email: formValues['email']);

      final request = await model.changeInfo(changInfo);
      if (request != null) {
        print("change info successfull (screen)");
        print(request.toJson());
        AppVariables.userInfo = request;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const NavigationBarDisplay(index: 2)),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Something wrong!!!")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(image: 'assets/images/carousel-2.jpg'),
        ScopedModel(
          model: changeInfoViewModel,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(title: const Text("Change Info")),
            body: Container(
              padding: const EdgeInsets.fromLTRB(50, 8, 50, 8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FormBuilder(
                      key: _formKey,
                      child: Column(children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            AppVariables.userInfo!.avatar,
                          ),
                          radius: MediaQuery.of(context).size.width * 0.25,
                        ),
                        const SizedBox(height: 16),
                        FormBuilderTextField(
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          name: 'name',
                          keyboardType: TextInputType.text,
                          initialValue: AppVariables.userInfo!.fullName,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[500]!.withOpacity(0.5),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.lightGreenAccent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            prefixIcon: const Icon(
                              Icons.face,
                              color: Colors.lightGreenAccent,
                              size: 28,
                            ),
                            labelText: 'Name',
                            hintText: 'Enter name',
                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(color: Colors.white),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.maxLength(70)
                          ]),
                        ),
                        const SizedBox(height: 16),
                        FormBuilderTextField(
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          name: 'email',
                          keyboardType: TextInputType.text,
                          initialValue: AppVariables.userInfo!.email,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[500]!.withOpacity(0.5),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.lightGreenAccent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            prefixIcon: const Icon(
                              Icons.mail,
                              color: Colors.lightGreenAccent,
                              size: 28,
                            ),
                            labelText: 'Email',
                            hintText: 'Enter email',
                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(color: Colors.white),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email()
                          ]),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ]),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            _changeInfo(context, changeInfoViewModel),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shadowColor: Colors.lightGreenAccent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
                        child: const Text(
                          "Edit",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
