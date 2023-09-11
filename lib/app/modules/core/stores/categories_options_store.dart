import 'package:flutter_triple/flutter_triple.dart';

import '../domain/entities/category.dart';

class CategoriesOptionsStore extends Store<List<Category>> {
  CategoriesOptionsStore() : super([]);

  getOptions(String value, List<Category> allOptions) {
    if (value.isEmpty) {
      update(allOptions);
    }
    final newState = allOptions.where((Category option) {
      return option.name.toLowerCase().contains(
            value.toLowerCase(),
          );
    }).toList();
    update(newState);
  }
}
