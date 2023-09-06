import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../domain/errors/auth_failure.dart';
import '../infra/datasources/auth_datasource.dart';

class AuthDatasource implements IAuthDatasource {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthDatasource(this._auth, this._googleSignIn);

  @override
  Map<String, dynamic> currentUser() {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        throw Failure(
          "Usuário não autenticado!",
          label: "AuthDatasource-currentUser",
        );
      } else {
        return {
          "uid": currentUser.uid,
          "name": currentUser.displayName,
          "photoUrl": currentUser.photoURL,
          "email": currentUser.email,
        };
      }
    } on FirebaseAuthException catch (e, stackTrace) {
      throw Failure(
        e.message ?? stackTrace.toString(),
        exception: e,
        label: "AuthDatasource-currentUser",
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future loginGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      if (googleAuth.idToken != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final response = await _auth.signInWithCredential(credential);
        return response.user;
      } else {
        throw Failure("Login cancelado pelo usuário");
      }
    } on FirebaseAuthException catch (e, stackTrace) {
      throw Failure(
        e.message ?? stackTrace.toString(),
        exception: e,
        label: "AuthDatasource-loginGoogle",
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<dynamic> loginApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
      );
      final response =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      return response.user;
    } on FirebaseAuthException catch (e, stackTrace) {
      throw Failure(
        e.message!,
        exception: e,
        label: "AuthDatasource-loginApple",
        stackTrace: stackTrace,
      );
    } on SignInWithAppleException catch (e, stackTrace) {
      throw Failure(
        e.toString(),
        exception: e,
        label: "AuthDatasource-loginApple",
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future logout() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } on FirebaseAuthException catch (e, stackTrace) {
      throw Failure(
        e.message!,
        exception: e,
        label: "AuthDatasource-logout",
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> updatePhotoURL(String photoUrl) async {
    try {
      await _auth.currentUser?.updatePhotoURL(photoUrl);
    } on FirebaseAuthException catch (e, stackTrace) {
      throw Failure(
        e.message!,
        exception: e,
        label: "AuthDatasource-updatePhotoURL",
        stackTrace: stackTrace,
      );
    }
  }
}
