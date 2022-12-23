import 'package:foody_app/ui/cart/cart_view_model.dart';

import 'package:foody_app/ui/member/login/login_screen.dart';
import 'package:foody_app/ultils/app_variables.dart';
import 'package:foody_app/ultils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Prefs.init();
    AppVariables.init();
    return ChangeNotifierProvider(
      create: (_) => CartViewModel(),
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  backgroundColor: Color.fromRGBO(60, 184, 21, 1)),
              // backgroundColor: const Color.fromRGBO(247, 248, 252, 1),
              cardTheme: const CardTheme(color: Color.fromRGBO(60, 184, 21, 1)),
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(246, 80, 5, 1))),
              textSelectionTheme: const TextSelectionThemeData(
                  cursorColor: Color.fromRGBO(60, 184, 21, 1)),
              inputDecorationTheme: const InputDecorationTheme(
                suffixIconColor: Colors.green,
                labelStyle: TextStyle(color: Colors.green),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(60, 184, 21, 1))),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(60, 184, 21, 1))),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Color.fromRGBO(60, 184, 21, 1),
                showUnselectedLabels: true,
                showSelectedLabels: true,
                selectedItemColor: Color.fromRGBO(246, 80, 5, 1),
                type: BottomNavigationBarType.fixed,
                selectedIconTheme:
                    IconThemeData(color: Color.fromRGBO(246, 80, 5, 1)),
                unselectedItemColor: Color.fromRGBO(247, 248, 252, 1),
                unselectedIconTheme:
                    IconThemeData(color: Color.fromRGBO(247, 248, 252, 1)),
              ),
            ),
            // home: const ChangePassword(),
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
