import '../../../core/domain/entities/category.dart';

class Nomo {
  String uid;
  List<Category> categories;
  Localization localization;

  Nomo(
      {required this.uid,
      required this.categories,
      required this.localization});

  factory Nomo.init() {
    return Nomo(
      uid: '',
      categories: [],
      localization: Localization(state: '', city: ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'categories': categories.map((e) => e.toJson()).toList(),
      'localization': localization.toJson(),
    };
  }

  Nomo copyWith(
      {String? uid, List<Category>? categories, Localization? localization}) {
    return Nomo(
        uid: uid ?? this.uid,
        categories: categories ?? this.categories,
        localization: localization ?? this.localization);
  }
}

class Localization {
  final String state;
  final String city;

  Localization({required this.state, required this.city});

  Map<String, dynamic> toJson() {
    return {
      'state': state,
      'city': city,
    };
  }
}
