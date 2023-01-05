import 'package:frontend/chat/domaine/entities/message_entity.dart';
import 'package:frontend/chat/domaine/repository/base_chat_repo.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class GetConversationMessagesUseCase {
  final BaseChatRepository repository;

  GetConversationMessagesUseCase(this.repository);

  Future<Either<Failure, List<MessageEntity>>> call(String id) async {
    return await repository.getMessages(id);
  }
}
