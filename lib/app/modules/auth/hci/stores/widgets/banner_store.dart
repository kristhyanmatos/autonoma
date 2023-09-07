import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/services/image_service.dart';

class BannerStore extends Store<String> {
  final IImageService _service;
  BannerStore(this._service) : super('');

  Future<void> selectImageCamera(Function onChanged) async {
    final response = await _service.selectImageCamera();
    response.fold((l) => setError(l.message), (r) => {update(r), onChanged(r)});
  }

  Future<void> selectImageGalery(Function onChanged) async {
    final response = await _service.selectImageGalery();
    response.fold((l) => setError(l.message), (r) => {update(r), onChanged(r)});
  }
}
