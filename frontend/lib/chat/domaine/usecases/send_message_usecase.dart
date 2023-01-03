import 'package:frontend/chat/data/model/message_model.dart';
import 'package:frontend/chat/domaine/repository/base_chat_repo.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class SendMessageUsecase {
  final BaseChatRepository repository;

  SendMessageUsecase(this.repository);

  Future<Either<Failure, Unit>> call(MessageModel messageModel) async {
    return await repository.sendMessage(messageModel);
  }
}
