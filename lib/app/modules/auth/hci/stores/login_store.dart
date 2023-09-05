import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/repositories/auth_repository.dart';

class LoginStore extends Store<void> {
  final IAuthRepository _repository;
  LoginStore(this._repository) : super(null);

  loginGoogle() async {
    setLoading(true);
    final response = await _repository.loginGoogle();
    response.fold(
      (l) => setError(l.message),
      (r) => {update(null), Modular.to.pushNamed('/chat/')},
    );
    setLoading(false);
  }

  loginApple() async {
    setLoading(true);
    final response = await _repository.loginApple();
    response.fold((l) => setError(l.message), (r) => update(null));
    setLoading(false);
  }
}
