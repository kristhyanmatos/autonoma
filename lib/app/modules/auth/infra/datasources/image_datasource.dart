abstract class IImageDatasource {
  Future<String?> selectImageGalery();
  Future<String?> selectImageCamera();
}
