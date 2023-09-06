import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../domain/errors/auth_failure.dart';
import '../infra/datasources/storage_datasource.dart';

class StorageImageDatasource implements IStorageImageDatasource {
  final FirebaseStorage _storage;

  StorageImageDatasource(this._storage);

  @override
  Future<String> put(String photoUri, String name, String path) async {
    try {
      File file = File(photoUri);
      String dotExtension = extension(file.path);
      String ref = "$path/$name$dotExtension";
      await _storage.ref(ref).putFile(file);
      return await _storage.ref(ref).getDownloadURL();
    } on FirebaseException catch (e, stackTrace) {
      throw Failure(
        e.message!,
        exception: e,
        stackTrace: stackTrace,
        label: "StorageImageDatasource-put",
      );
    }
  }
}
