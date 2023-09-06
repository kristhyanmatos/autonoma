import 'package:dartz/dartz.dart';
import '../../domain/entities/nomo.dart';
import '../../domain/errors/auth_failure.dart';
import '../../domain/repositories/nomo_repository.dart';
import '../datasources/auth_datasource.dart';
import '../datasources/nomo_datasource.dart';

class NomoRepository implements INomoRepository {
  final INomoDatasource _datasource;
  final IAuthDatasource _authDatasource;

  NomoRepository(this._datasource, this._authDatasource);

  @override
  Future<Either<Failure, void>> create(Nomo nomo) async {
    try {
      final currentUser = _authDatasource.currentUser();
      nomo.uid = currentUser['uid'];
      await _datasource.create(nomo);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> preCreate(String name) async {
    try {
      final response = await _datasource.preCreate(name);
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
