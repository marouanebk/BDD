import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/chat/data/model/message_model.dart';
import 'package:frontend/chat/domaine/entities/conversation_entity.dart';
import 'package:frontend/chat/domaine/entities/message_entity.dart';
import 'package:frontend/chat/domaine/usecases/add_conversation_usecase.dart';
import 'package:frontend/chat/domaine/usecases/getAllCovnersationUseCase.dart';
import 'package:frontend/chat/domaine/usecases/get_messages_usecase.dart';
import 'package:frontend/chat/domaine/usecases/send_message_usecase.dart';
import 'package:frontend/cores/utils/enums.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetAllConversationsUseCase getAllConversationsUseCase;
  final AddConversationUseCase addConversationUseCase;
  final GetConversationMessagesUseCase getConversationMessagesUseCase;
  final SendMessageUsecase sendMessageUsecase;
  ChatBloc(
    this.getAllConversationsUseCase,
    this.addConversationUseCase,
    this.getConversationMessagesUseCase,
    this.sendMessageUsecase,
  ) : super(const ChatState()) {
    on<GetAllConversationsEvent>(_getAllCovnersationuseCase);
    on<AddConversationEvent>(_addConversationUseCase);
    on<GetMessagesEvent>(_getMessagesEvent);
    on<SendMessageEvent>(_sendMessageEvent);
  }

  FutureOr<void> _getAllCovnersationuseCase(
      GetAllConversationsEvent event, Emitter<ChatState> emit) async {
    final result = await getAllConversationsUseCase();
    result.fold(
      (l) => emit(
        state.copyWith(
          getAllConversationsState: RequestState.error,
          getAllConversationsmessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getAllConversations: r,
          getAllConversationsState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _sendMessageEvent(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    final result = await sendMessageUsecase(event.messageModel);
    result.fold(
      (l) => emit(
        state.copyWith(
            // getAllConversationsState: RequestState.error,
            // getAllConversationsmessage: l.message,
            ),
      ),
      (r) => emit(
        state.copyWith(
          addMessageSucess: true,
          // getAllConversationsmessage: ,
          // getAllConversationsState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getMessagesEvent(
      GetMessagesEvent event, Emitter<ChatState> emit) async {
    final result = await getConversationMessagesUseCase(event.id);
    result.fold(
      (l) => emit(
        state.copyWith(
          getMessagesState: RequestState.error,
          getAllConversationsmessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getMessages: r,
          getMessagesState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _addConversationUseCase(
      AddConversationEvent event, Emitter<ChatState> emit) async {
    final result = await addConversationUseCase(event.toId);
    result.fold(
      (l) => emit(
        state.copyWith(
          addConversationState: RequestState.error,
          addCovnersationmessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          addCovnersationSuccess: true,
          addConversationState: RequestState.loaded,
        ),
      ),
    );
  }
}
