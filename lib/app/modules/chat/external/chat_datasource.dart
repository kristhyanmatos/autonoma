import 'package:cloud_firestore/cloud_firestore.dart';

import '../infra/models/message.dart';
import '../infra/datasources/chat_datasource.dart';

class ChatDatasource implements IChatDatasource {
  final FirebaseFirestore _firestore;

  ChatDatasource(this._firestore);

  @override
  Stream<QuerySnapshot> getAllMessages(String chatId) {
    final chatColletion = _firestore.collection('chat');
    final chat = chatColletion.doc(chatId);
    final collection = chat.collection('messages');
    final snapshot =
        collection.orderBy('timestamp', descending: true).snapshots();

    return snapshot;
  }

  @override
  Future<void> sendMessage(String chatId, MessageModel messageModel) async {
    MessageModel chatMessages = MessageModel(
      author: messageModel.author,
      timestamp: Timestamp.now(),
      data: messageModel.data,
    );

    await _firestore.collection('messages').add(chatMessages.toJson());
  }
}
