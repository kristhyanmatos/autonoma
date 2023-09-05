import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../domain/errors/chat_failure.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_datasource.dart';
import '../models/message.dart';

class ChatRepository implements IChatRepository {
  final IChatDatasource _datasource;

  ChatRepository(this._datasource);

  @override
  Either<ChatFailure, Stream<QuerySnapshot>> getAllMessages(String chatId) {
    try {
      final response = _datasource.getAllMessages(chatId);
      return Right(response);
    } on ChatFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ChatFailure, void>> sendMessage(
    String chatId,
    MessageModel messageModel,
  ) async {
    try {
      await _datasource.sendMessage(chatId, messageModel);
      return const Right(null);
    } on ChatFailure catch (e) {
      return Left(e);
    }
  }
}
