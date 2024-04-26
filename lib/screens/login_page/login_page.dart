import 'package:flutter/material.dart';
import 'package:task_management_app/screens/widgets/input_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    required this.onLogin,
    required this.onLoginGoogle,
    required this.onChangeUsername,
    required this.onChangePassword,
    super.key,
  });

  final VoidCallback onLoginGoogle;
  final VoidCallback onLogin;
  final ValueChanged<String> onChangeUsername;
  final ValueChanged<String> onChangePassword;

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
          InputField(
            padding: const EdgeInsets.all(16.0),
            hintText: 'Username',
            onChangeText: (username) => onChangeUsername(username),
          ),
          InputField(
            padding: const EdgeInsets.all(16.0),
            hintText: 'Password',
            onChangeText: (password) => onChangePassword(password),
          ),
          ElevatedButton(
            onPressed: () => onLogin(),
            child: const Text('Login'),
          ),
          ElevatedButton(
            onPressed: () => onLoginGoogle,
            child: const Text('Login with google'),
          ),
        ],
      ),
    );
  }
}
