import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../domain/repositories/nomo_repository.dart';

class UserNomoStore extends Store<User> {
  final IAuthRepository _authRepository;
  final INomoRepository _nomoRepository;
  UserNomoStore(this._authRepository, this._nomoRepository)
      : super(User.init());

  Future putUser() async {
    setLoading(true);
    final response = await _authRepository.updatePhotoURL(
      state.urlPhoto,
      'nomo/photoProfile',
    );
    await response.fold(
      (l) async => setError(l.message),
      (_) async {
        final response = await _nomoRepository.preCreate(state.name);
        response.fold(
          (l) => setError(l.message),
          (r) => {setLoading(false), Modular.to.pushNamed('/category_nomo')},
        );
      },
    );
  }

  setUserName(String value) {
    final newState = state.copyWith(name: value);
    update(newState);
  }

  setUserPhotoUrl(String value) {
    final newState = state.copyWith(urlPhoto: value);
    update(newState);
  }
}
