abstract class IAuthDatasource {
  Future<dynamic> loginGoogle();
  Future<dynamic> loginApple();
  Future<void> logout();
}
