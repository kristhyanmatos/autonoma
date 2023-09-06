import 'package:autonoma/app/modules/auth/domain/entities/nomo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../domain/errors/auth_failure.dart';
import '../infra/datasources/nomo_datasource.dart';

class NomoDatasource implements INomoDatasource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _store;

  NomoDatasource(this._auth, this._store);

  @override
  Future<void> create(Nomo nomo) async {
    try {
      final collection = _store.collection('nomo');
      await collection.doc(nomo.uid).set(nomo.toJson());
    } on FirebaseAuthException catch (e, stackTrace) {
      throw Failure(
        e.message!,
        exception: e,
        label: "NomoDatasource-create",
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> preCreate(String name) async {
    try {
      await _auth.currentUser?.updateDisplayName(name);
    } on FirebaseAuthException catch (e, stackTrace) {
      throw Failure(
        e.message!,
        exception: e,
        label: "NomoDatasource-preCreate",
        stackTrace: stackTrace,
      );
    }
  }
}
