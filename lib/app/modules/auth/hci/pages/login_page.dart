import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../stores/login_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginStore store = Modular.get<LoginStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              child: const Text("Google"),
              onPressed: () => store.loginGoogle(),
            ),
            OutlinedButton(
              child: const Text("Apple"),
              onPressed: () => store.loginApple(),
            ),
            FilledButton(
              onPressed: () => Modular.to.pushNamed('/welcome_nomo'),
              child: const Text('Juntar-se ao NoMo'),
            ),
          ],
        ),
      ),
    );
  }
}
