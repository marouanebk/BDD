import 'package:frontend/chat/domaine/repository/base_chat_repo.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class AddConversationUseCase {
  final BaseChatRepository repository;

  AddConversationUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String toId) async {
    return await repository.addConversation(toId);
  }
}
