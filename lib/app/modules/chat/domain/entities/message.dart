import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String author;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.author,
    required this.message,
    required this.timestamp,
  });
}
