import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../infra/datasources/image_datasource.dart';

class ImageDatasource implements IImageDatasource {
  @override
  Future<String?> selectImageGalery() async {
    XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      String? fileCut = await _cropperImage(file.path);

      if (fileCut != null) {
        return fileCut;
      }
    }
    return null;
  }

  @override
  Future<String?> selectImageCamera() async {
    XFile? file = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (file != null) {
      String? fileCut = await _cropperImage(file.path);

      if (fileCut != null) {
        return fileCut;
      }
    }
    return null;
  }

  Future<String?> _cropperImage(String path) async {
    final cropImage = ImageCropper();
    final cropFile = await cropImage.cropImage(
      sourcePath: path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      cropStyle: CropStyle.rectangle,
    );
    return cropFile?.path;
  }
}
