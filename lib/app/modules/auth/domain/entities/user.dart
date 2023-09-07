class User {
  late String uid;
  late String name;
  late String urlPhoto;
  late String email;

  User(
      {required this.uid,
      required this.name,
      required this.urlPhoto,
      required this.email});

  User.init() {
    uid = '';
    name = '';
    urlPhoto = '';
    email = '';
  }
  User copyWith({String? uid, String? name, String? urlPhoto, String? email}) {
    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      urlPhoto: urlPhoto ?? this.urlPhoto,
      email: email ?? this.email,
    );
  }
}
