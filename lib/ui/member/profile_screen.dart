import 'package:foody_app/ui/member/change_info/change_info_screen.dart';
import 'package:foody_app/ui/member/change_password/change_password_screen.dart';
import 'package:foody_app/ui/member/login/login_screen.dart';
import 'package:foody_app/ui/order/order_history_screen.dart';
import 'package:foody_app/ui/receiver/receiver_screen.dart';
import 'package:foody_app/ultils/app_variables.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                AppVariables.userInfo!.avatar,
              ),
              radius: MediaQuery.of(context).size.width * 0.25,
            ),
            const SizedBox(height: 16),
            Text(
              AppVariables.userInfo!.fullName,
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              AppVariables.userInfo!.email,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChangeInfoScreen()),
                );
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(
                    Icons.people_alt_outlined,
                    color: Color.fromARGB(255, 107, 148, 72),
                  ),
                  title: Text('Change User Info'),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChangePassword()),
                );
              },
              child: const Card(
                child: ListTile(
                    leading: Icon(
                      Icons.password_outlined,
                      color: Color.fromARGB(255, 107, 148, 72),
                    ),
                    title: Text('Change Password')),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReceiverScreen()),
                );
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(
                    Icons.receipt,
                    color: Color.fromARGB(255, 107, 148, 72),
                  ),
                  title: Text('Receier'),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrderHistoryScreen()),
                );
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(
                    Icons.history_outlined,
                    color: Color.fromARGB(255, 107, 148, 72),
                  ),
                  title: Text('Order History'),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false);
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(
                    Icons.login_outlined,
                    color: Color.fromARGB(255, 107, 148, 72),
                  ),
                  title: Text('Log Out'),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
