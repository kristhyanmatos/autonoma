import 'package:dartz/dartz.dart';

import '../errors/auth_failure.dart';

abstract class IImageService {
  Future<Either<Failure, String>> selectImageGalery();
  Future<Either<Failure, String>> selectImageCamera();
}
