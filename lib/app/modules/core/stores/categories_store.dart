import 'package:flutter_triple/flutter_triple.dart';

import '../domain/entities/category.dart';
import '../domain/services/categories_service.dart';

class CategoriesStore extends Store<List<Category>> {
  final ICategoriesService _service;
  CategoriesStore(this._service) : super([]);

  Future getAllCategories() async {
    setLoading(true);
    final response = await _service.gettAllCategories();
    response.fold((l) => null, (r) => update(r));
    setLoading(false);
  }
}
