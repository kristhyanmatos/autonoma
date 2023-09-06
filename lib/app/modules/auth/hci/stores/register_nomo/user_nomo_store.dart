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
      (l) async => null,
      (_) async {
        final response = await _nomoRepository.preCreate(state.name);
        response.fold(
          (l) => null,
          (r) => Modular.to.pushNamed('/category_nomo'),
        );
      },
    );
    setLoading(false);
  }
}
