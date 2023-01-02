import 'package:frontend/chat/data/datasource/chat_datasource.dart';
import 'package:frontend/chat/domaine/entities/conversation_entity.dart';
import 'package:frontend/chat/domaine/entities/message_entity.dart';
import 'package:frontend/chat/domaine/repository/base_chat_repo.dart';
import 'package:frontend/cores/error/exceptions.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class ChatRepository implements BaseChatRepository {
  final BaseChatRemoteDataSource baseChatRemoteDataSource;

  ChatRepository(this.baseChatRemoteDataSource);

  @override
  Future<Either<Failure, Unit>> addConversation(String toId) async {
    try {
      final result = await baseChatRemoteDataSource.addCovnersation(toId);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<ConversationEntity>>>
      getAllConversations() async {
    try {
      final result = await baseChatRemoteDataSource.getAllConversations();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MessageEntity>>> getMessages(String id) async {
    try {
      final result = await baseChatRemoteDataSource.getMessages(id);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
