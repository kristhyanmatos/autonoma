import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../infra/models/message.dart';
import '../errors/chat_failure.dart';

abstract class IChatRepository {
  Either<ChatFailure, Stream<QuerySnapshot>> getAllMessages(String chatId);
  Future<Either<ChatFailure, void>> sendMessage(
    String chatId,
    MessageModel messageModel,
  );
}
