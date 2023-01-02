// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ConversationEntity extends Equatable {
  final String conversationId;
  final String sender;
  final String reciever;

  const ConversationEntity({
    required this.conversationId,
    required this.sender,
    required this.reciever,
  });

  @override
  List<Object> get props => [
        conversationId,
        sender,
        reciever,
      ];
}
