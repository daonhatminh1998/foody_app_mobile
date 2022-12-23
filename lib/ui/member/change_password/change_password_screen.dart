import 'package:foody_app/components/background-image.dart';
import 'package:foody_app/ui/member/change_password/change_password_view_model.dart';
import 'package:foody_app/ui/member/login/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:scoped_model/scoped_model.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormBuilderState>();
  final changePasswordViewModel = ChangePasswordViewModel();

  bool _hidePassword = true;
  bool _hidenewPassword = true;
  bool _hideconfirmPassword = true;
  IconData _icon = Icons.visibility;
  IconData _iconNew = Icons.visibility;
  IconData _iconConfirm = Icons.visibility;

  void _changePassword(var context, ChangePasswordViewModel model) async {
    print("change password (screen)");
    final curState = _formKey.currentState!;
    curState.save();
    if (curState.validate()) {
      print(curState.value);

      final formValues = curState.value;
      final password = formValues['password'].toString();
      final newPassword = formValues['newPassword'].toString();
      final confirmPassword = formValues['confirmPassword'].toString();

      final request =
          await model.changePassword(password, newPassword, confirmPassword);
      if (request == true) {
        print("change password successful (screen)");
        print(request);

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content:
                Text("Wrong password or newPassword or confirmPassword !!!")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(image: 'assets/images/carousel-2.jpg'),
        ScopedModel(
          model: changePasswordViewModel,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(title: const Text("Change Password")),
            body: Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(50, 8, 50, 8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FormBuilder(
                        key: _formKey,
                        child: Column(
                          children: [
                            FormBuilderTextField(
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              name: 'password',
                              obscureText: _hidePassword,
                              keyboardType: TextInputType.visiblePassword,
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
                                  borderSide: BorderSide(
                                      color: Colors.lightGreenAccent),
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
                                  Icons.lock,
                                  size: 28,
                                  color: Colors.lightGreenAccent,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _hidePassword = !_hidePassword;
                                      _icon = _hidePassword
                                          ? Icons.visibility
                                          : Icons.visibility_off;
                                    });
                                  },
                                  icon: Icon(_icon),
                                  color: Colors.lightGreenAccent,
                                ),
                                labelText: 'Password',
                                hintText: "Enter New Password",
                                hintStyle: const TextStyle(color: Colors.white),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            FormBuilderTextField(
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              name: "newPassword",
                              obscureText: _hidenewPassword,
                              keyboardType: TextInputType.visiblePassword,
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
                                  borderSide: BorderSide(
                                      color: Colors.lightGreenAccent),
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
                                  Icons.lock,
                                  size: 28,
                                  color: Colors.lightGreenAccent,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _hidenewPassword = !_hidenewPassword;
                                      _iconNew = _hidenewPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off;
                                    });
                                  },
                                  icon: Icon(_iconNew),
                                  color: Colors.lightGreenAccent,
                                ),
                                labelText: "New Password",
                                hintText: "Enter New Password",
                                hintStyle: const TextStyle(color: Colors.white),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                              ),
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required()]),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            FormBuilderTextField(
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              name: "confirmPassword",
                              obscureText: _hideconfirmPassword,
                              keyboardType: TextInputType.visiblePassword,
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
                                    borderSide: BorderSide(
                                        color: Colors.lightGreenAccent),
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
                                    Icons.lock,
                                    size: 28,
                                    color: Colors.lightGreenAccent,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _hideconfirmPassword =
                                            !_hideconfirmPassword;
                                        _iconConfirm = _hideconfirmPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off;
                                      });
                                    },
                                    icon: Icon(_iconConfirm),
                                    color: Colors.lightGreenAccent,
                                  ),
                                  labelText: "Confirm Password",
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  hintStyle:
                                      const TextStyle(color: Colors.white),
                                  hintText: "Enter confirm password"),
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required()]),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () =>
                              _changePassword(context, changePasswordViewModel),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              shadowColor: Colors.lightGreenAccent,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)))),
                          child: const Text(
                            "Confirm",
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
        ),
      ],
    );
  }
}
