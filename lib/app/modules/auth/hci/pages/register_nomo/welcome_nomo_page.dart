import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../stores/register_nomo/welcome_nomo_store.dart';

class WelcomeNomoPage extends StatefulWidget {
  const WelcomeNomoPage({super.key});

  @override
  State<WelcomeNomoPage> createState() => _WelcomeNomoPageState();
}

class _WelcomeNomoPageState extends State<WelcomeNomoPage> {
  WelcomeNomoStore store = Modular.get<WelcomeNomoStore>();

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
          ],
        ),
      ),
    );
  }
}
