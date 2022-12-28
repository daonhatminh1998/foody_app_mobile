// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foody_app/ui/member/login/login_view_model.dart';
import 'package:foody_app/ultils/app_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  String _username = "";
  String _password = "";
  @override
  void initState() {
    super.initState();
    print('landing screen initstate');
    _loadUserInfo();
  }

  _loadUserInfo() async {
    LoginViewModel model = LoginViewModel();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _username = (prefs.getString('username') ?? "");
    _password = (prefs.getString('password') ?? "");

    if (_username == "" ||
        _password == "" ||
        (_username == "" && _password == "")) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/login', ModalRoute.withName('/login'));
    } else {
      var req = await model.login(_username, _password);
      AppVariables.userInfo = req;
      Navigator.pushNamedAndRemoveUntil(
          context, '/home', ModalRoute.withName('/home'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
