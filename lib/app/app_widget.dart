import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setObservers([Asuka.asukaHeroController]);
    return MaterialApp.router(
      title: 'Nomo',
      builder: Asuka.builder,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xff007a91),
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
