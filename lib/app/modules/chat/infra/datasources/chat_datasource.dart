import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/message.dart';

abstract class IChatDatasource {
  Stream<QuerySnapshot> getAllMessages(String chatId);
  Future<void> sendMessage(String chatId, MessageModel messageModel);
}
