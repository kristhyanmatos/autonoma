import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/entities/nomo.dart';
import '../../../domain/repositories/nomo_repository.dart';

class CategoryNomoStore extends Store<Nomo> {
  final INomoRepository _repository;
  CategoryNomoStore(this._repository) : super(Nomo.init());

  Future<void> create() async {
    final response = await _repository.create(state);
    response.fold((l) => null, (r) => Modular.to.pushNamed('/completed_nomo'));
  }
}
