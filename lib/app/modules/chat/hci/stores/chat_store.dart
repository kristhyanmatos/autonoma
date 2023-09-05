import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/repositories/chat_repository.dart';
import '../../infra/models/message.dart';

class ChatStore extends Store<Stream<QuerySnapshot>> {
  final IChatRepository _repository;
  ChatStore(this._repository) : super(const Stream.empty());

  getChat(String chatId) {
    final response = _repository.getAllMessages(chatId);
    response.fold((l) => print(l.message), (r) => update(r));
  }

  sendMessage(String chatId, MessageModel messageModel) async {
    final response = await _repository.sendMessage(chatId, messageModel);
    response.fold((l) => print(l.message), (r) => null);
  }
}
