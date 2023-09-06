abstract class IAuthDatasource {
  Map<String, dynamic> currentUser();
  Future<dynamic> loginGoogle();
  Future<dynamic> loginApple();
  Future<void> logout();
  Future<void> updatePhotoURL(String photoUrl);
}
