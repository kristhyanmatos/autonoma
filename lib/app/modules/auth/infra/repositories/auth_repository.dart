import 'package:dartz/dartz.dart';

import '../../domain/entities/user.dart';
import '../../domain/errors/auth_failure.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_datasource.dart';
import '../datasources/storage_datasource.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDatasource _datasource;
  final IStorageImageDatasource _imageDatasource;

  AuthRepository(this._datasource, this._imageDatasource);

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
  Future<Either<Failure, void>> updatePhotoURL(
    String photoUri,
    String path,
  ) async {
    try {
      final currentUser = _datasource.currentUser();
      final response = await _imageDatasource.put(
        photoUri,
        currentUser['uid'],
        path,
      );
      await _datasource.updatePhotoURL(response);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _datasource.logout();
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword() {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> resetPassword() {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updatePassword() {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }
}
