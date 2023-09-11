import 'package:autonoma/app/modules/core/domain/entities/category.dart';

import 'package:autonoma/app/modules/core/domain/errors/core_error.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../domain/services/categories_service.dart';

class CategoriesService implements ICategoriesService {
  final FirebaseFirestore _firestore;

  CategoriesService(this._firestore);

  @override
  Future<Either<CoreFailure, List<Category>>> gettAllCategories() async {
    try {
      final data =
          await _firestore.collection('categories').orderBy('name').get();
      List<Category> list = data.docs.map((item) {
        return Category(id: item.id, name: item.data()['name']);
      }).toList();
      return Right(list);
    } on FirebaseAuthException catch (e, stackTrace) {
      return Left(CoreFailure(
        e.message!,
        exception: e,
        label: "CategoriesService-gettAllCategories",
        stackTrace: stackTrace,
      ));
    }
  }
}
