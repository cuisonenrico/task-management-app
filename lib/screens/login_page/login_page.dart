import 'package:flutter/material.dart';
import 'package:task_management_app/utilities/handlers/user_handler.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const routeName = 'login-page';
  static const route = '/login-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.calendar_month,
            size: 100.0,
          ),
          ElevatedButton(
            onPressed: () async => await UsersHandler().signInWithGoogle(),
            child: const Text('Login with google'),
          ),
        ],
      ),
    );
  }
}
