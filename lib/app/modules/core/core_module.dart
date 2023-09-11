import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/services/categories_service.dart';
import 'services/categories_service.dart';
import 'stores/categories_store.dart';
import 'stores/categories_options_store.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addInstance(FirebaseFirestore.instance);
    i.addSingleton<ICategoriesService>(CategoriesService.new);
    i.addSingleton(CategoriesStore.new);
    i.addSingleton(CategoriesOptionsStore.new);
  }
}
