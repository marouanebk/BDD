import 'package:frontend/chat/domaine/entities/conversation_entity.dart';
import 'package:frontend/chat/domaine/repository/base_chat_repo.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class GetAllConversationsUseCase {
  final BaseChatRepository repository;

  GetAllConversationsUseCase(this.repository);

  Future<Either<Failure, List<ConversationEntity>>> call() async {
    return await repository.getAllConversations();
  }
}
