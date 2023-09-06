import 'package:dartz/dartz.dart';

import '../entities/category.dart';
import '../errors/core_error.dart';

abstract class ICategoriesService {
  Future<Either<CoreFailure, List<Category>>> gettAllCategories();
}
