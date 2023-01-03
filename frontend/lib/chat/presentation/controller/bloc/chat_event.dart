part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class GetAllConversationsEvent extends ChatEvent {}

class AddConversationEvent extends ChatEvent {
  final String toId;

  const AddConversationEvent(this.toId);
  @override
  List<Object> get props => [toId];
}

class GetMessagesEvent extends ChatEvent {
  final String id;

  const GetMessagesEvent(this.id);
  @override
  List<Object> get props => [id];
}

class SendMessageEvent extends ChatEvent {
  final MessageModel messageModel;

  const SendMessageEvent(this.messageModel);
  @override
  List<Object> get props => [messageModel];
}
