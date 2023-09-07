import 'package:autonoma/app/modules/auth/domain/errors/auth_failure.dart';

import 'package:dartz/dartz.dart';

import '../../domain/services/image_service.dart';
import '../datasources/image_datasource.dart';

class ImageService implements IImageService {
  final IImageDatasource _datasource;

  ImageService(this._datasource);

  @override
  Future<Either<Failure, String>> selectImageCamera() async {
    try {
      final response = await _datasource.selectImageCamera();
      if (response == null) {
        return Left(Failure('Nenhuma imagem capturada!'));
      }
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, String>> selectImageGalery() async {
    try {
      final response = await _datasource.selectImageGalery();
      if (response == null) {
        return Left(Failure('Nenhuma imagem selecionada!'));
      }
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
