import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/repositories/auth_repository.dart';

class WelcomeNomoStore extends Store<void> {
  final IAuthRepository _repository;
  WelcomeNomoStore(this._repository) : super(null);

  loginGoogle() async {
    setLoading(true);
    final response = await _repository.loginGoogle();
    response.fold(
      (l) => setError(l.message),
      (r) => {update(null), Modular.to.pushNamed('/user_nomo')},
    );
    setLoading(false);
  }

  loginApple() async {
    setLoading(true);
    final response = await _repository.loginApple();
    response.fold(
      (l) => setError(l.message),
      (r) => {update(null), Modular.to.pushNamed('/user_nomo')},
    );
    setLoading(false);
  }
}
