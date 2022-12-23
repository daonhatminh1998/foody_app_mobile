import 'package:foody_app/components/background-image.dart';
import 'package:foody_app/ui/member/login/login_screen.dart';
import 'package:foody_app/ui/member/register/register_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:scoped_model/scoped_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final registerViewModel = RegisterViewModel();

  bool _hidePassword = true;
  bool _hideconfirmPassword = true;

  IconData _icon = Icons.visibility;
  IconData _iconConfirm = Icons.visibility;

  void _register(var context, RegisterViewModel model) async {
    print("Register (screen)");
    final curState = _formKey.currentState!;
    curState.save();
    if (curState.validate()) {
      print(curState.value);

      final formValues = curState.value;
      final username = formValues['username'].toString();
      final name = formValues['name'].toString();
      final email = formValues['email'].toString();
      final password = formValues['password'].toString();
      final confirmPassword = formValues['confirmPassword'].toString();

      final request = await model.register(
          username, name, email, password, confirmPassword);

      if (request == true) {
        print("Register successfull (screen)");

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Something wrong ")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(image: 'assets/images/carousel-2.jpg'),
        ScopedModel(
          model: registerViewModel,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(title: const Text("Register")),
            body: Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(50, 8, 50, 8),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              name: 'username',
                              keyboardType: TextInputType.text,
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
                                  Icons.people,
                                  color: Colors.lightGreenAccent,
                                  size: 28,
                                ),
                                labelText: 'UserName',
                                hintText: 'Enter username',
                                hintStyle: const TextStyle(color: Colors.white),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
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
                              name: 'name',
                              keyboardType: TextInputType.text,
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
                                  Icons.face,
                                  color: Colors.lightGreenAccent,
                                  size: 28,
                                ),
                                labelText: 'Name',
                                hintText: 'Enter name',
                                hintStyle: const TextStyle(color: Colors.white),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
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
                                  Icons.mail,
                                  color: Colors.lightGreenAccent,
                                  size: 28,
                                ),
                                labelText: 'Email',
                                hintText: 'Enter email',
                                hintStyle: const TextStyle(color: Colors.white),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.email()
                              ]),
                            ),
                            const SizedBox(height: 16),
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
                            const SizedBox(height: 16),
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
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () =>
                                    _register(context, registerViewModel),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    shadowColor: Colors.lightGreenAccent,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)))),
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
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
