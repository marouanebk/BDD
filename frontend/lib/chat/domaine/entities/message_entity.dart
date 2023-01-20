// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String conversationId;
  final String sender;
  final DateTime? createdAt;
  final String message;
  final String? to;
  const MessageEntity({
    required this.conversationId,
    required this.sender,
    this.createdAt,
    required this.message,
    this.to,
  });

  @override
  List<Object?> get props => [
        conversationId,
        sender,
        createdAt,
        message,
        to,
      ];
}
