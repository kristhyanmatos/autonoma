import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String author;
  String data;
  Timestamp timestamp;

  MessageModel({
    required this.author,
    required this.data,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'data': data,
      'timestamp': timestamp,
    };
  }

  factory MessageModel.fromDocument(DocumentSnapshot documentSnapshot) {
    String author = documentSnapshot.get('author');
    String data = documentSnapshot.get('data');
    Timestamp timestamp = documentSnapshot.get('timestamp');

    return MessageModel(author: author, data: data, timestamp: timestamp);
  }
}
