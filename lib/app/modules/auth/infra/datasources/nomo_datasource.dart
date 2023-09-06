import '../../domain/entities/nomo.dart';

abstract class INomoDatasource {
  Future<void> create(Nomo nomo);
  Future<void> preCreate(String name);
}
