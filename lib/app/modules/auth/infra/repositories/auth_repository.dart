import 'package:dartz/dartz.dart';

import '../../domain/entities/user.dart';
import '../../domain/errors/auth_failure.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_datasource.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDatasource _datasource;

  AuthRepository(this._datasource);

  @override
  Future<Either<Failure, User>> loginGoogle() async {
    try {
      final response = await _datasource.loginGoogle();
      if (response != null) {
        return Right(
          User(
            uid: response.uid ?? "",
            name: response.displayName ?? "",
            urlPhoto: response.photoURL ?? "",
            email: response.email ?? "",
            type: response.phoneNumber ?? "",
          ),
        );
      } else {
        return Left(
          Failure("Desculpe, erro ao encontrar usuário, tente novamente."),
        );
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, User>> loginApple() async {
    try {
      final response = await _datasource.loginApple();
      if (response != null) {
        return Right(
          User(
            uid: response.uid ?? "",
            name: response.displayName ?? "",
            urlPhoto: response.photoURL ?? "",
            email: response.email ?? "",
            type: response.phoneNumber ?? "",
          ),
        );
      } else {
        return Left(
          Failure("Desculpe, erro ao encontrar usuário, tente novamente."),
        );
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
