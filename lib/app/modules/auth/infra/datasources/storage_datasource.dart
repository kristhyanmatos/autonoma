abstract class IStorageImageDatasource {
  Future<String> put(String photoUri, String name, String path);
}
