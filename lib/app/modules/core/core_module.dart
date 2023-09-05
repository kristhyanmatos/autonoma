import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addInstance(FirebaseFirestore.instance);
  }
}
