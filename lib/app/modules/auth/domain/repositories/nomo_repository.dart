import 'package:dartz/dartz.dart';

import '../entities/nomo.dart';
import '../errors/auth_failure.dart';

abstract class INomoRepository {
  Future<Either<Failure, void>> preCreate(String name);
  Future<Either<Failure, void>> create(Nomo nomo);
}
