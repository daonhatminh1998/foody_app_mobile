import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:foody_app/components/background-image.dart';
import 'package:foody_app/components/navigation_bar.dart';

import 'package:foody_app/ui/member/login/login_view_model.dart';
import 'package:foody_app/ui/member/register/register_screen.dart';
import 'package:foody_app/ultils/app_variables.dart';
import 'package:foody_app/ultils/prefs.dart';

import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool _hidePassword = true;
  IconData _icon = Icons.visibility;

  final _formKey = GlobalKey<FormBuilderState>();
  final loginViewModel = LoginViewModel();

  void _doLogin(var context, LoginViewModel model) async {
    print("doLogin (screen)");
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });

      final formValues = _formKey.currentState!.value;
      final username = formValues['username'].toString();
      final password = formValues['password'].toString();
      final request = await model.login(username, password);

      if (request != null) {
        print("login successfull (screen)");
        print(request.toJson());

        AppVariables.userInfo = request;
        Prefs.setUsername(username);
        Prefs.setPassword(password);

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const NavigationBarDisplay()),
            (route) => false);
      } else {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Wrong username or password!!!")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(image: 'assets/images/carousel-2.jpg'),
        ScopedModel(
          model: loginViewModel,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Builder(builder: (context) {
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  margin: const EdgeInsets.all(16),
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: Colors.white))),
                              child: const Text(
                                "Welcome to",
                                style: TextStyle(
                                  fontFamily: 'Calistoga',
                                  fontSize: 30,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.lightGreen,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  "Foody Store",
                                  style: TextStyle(
                                      fontFamily: 'Amiri',
                                      fontSize: 60,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.redAccent),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ),
                        const SizedBox(
                          height: 80,
                        ),
                        Column(
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
                            const SizedBox(height: 20),
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
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Doesn't have account?",
                                  style: TextStyle(
                                      fontFamily: 'Amiri',
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.indigo[50]),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterScreen()),
                                    );
                                  },
                                  child: Text(
                                    'Sign up here',
                                    style: TextStyle(
                                        fontFamily: 'Amiri',
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.red[700]),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () =>
                                    _doLogin(context, loginViewModel),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    shadowColor: Colors.lightGreenAccent,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)))),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
