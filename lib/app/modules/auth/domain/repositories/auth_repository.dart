import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../errors/auth_failure.dart';

abstract class IAuthRepository {
  Future<Either<Failure, User>> loginGoogle();
  Future<Either<Failure, User>> loginApple();
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> updatePhotoURL(String photoUri, String path);
  Future<Either<Failure, void>> forgotPassword();
  Future<Either<Failure, void>> resetPassword();
  Future<Either<Failure, void>> updatePassword();
}
