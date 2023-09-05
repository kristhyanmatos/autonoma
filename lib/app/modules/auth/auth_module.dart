import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'domain/repositories/auth_repository.dart';
import 'external/auth_datasource.dart';
import 'hci/pages/login_page.dart';
import 'hci/stores/login_store.dart';
import 'infra/datasources/auth_datasource.dart';
import 'infra/repositories/auth_repository.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance(FirebaseAuth.instance);
    i.addInstance(GoogleSignIn());
    i.addSingleton<IAuthDatasource>(AuthDatasource.new);
    i.addSingleton<IAuthRepository>(AuthRepository.new);
    i.add(LoginStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const LoginPage());
  }
}
