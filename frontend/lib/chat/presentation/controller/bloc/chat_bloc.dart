import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/chat/domaine/entities/conversation_entity.dart';
import 'package:frontend/chat/domaine/entities/message_entity.dart';
import 'package:frontend/chat/domaine/usecases/add_conversation_usecase.dart';
import 'package:frontend/chat/domaine/usecases/getAllCovnersationUseCase.dart';
import 'package:frontend/chat/domaine/usecases/get_messages_usecase.dart';
import 'package:frontend/cores/utils/enums.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetAllConversationsUseCase getAllConversationsUseCase;
  final AddConversationUseCase addConversationUseCase;
  final GetConversationMessagesUseCase getConversationMessagesUseCase;
  ChatBloc(
    this.getAllConversationsUseCase,
    this.addConversationUseCase,
    this.getConversationMessagesUseCase,
  ) : super(const ChatState()) {
    on<GetAllConversationsEvent>(_getAllCovnersationuseCase);
    on<AddConversationEvent>(_addConversationUseCase);
    on<GetMessagesEvent>(_getMessagesEvent);
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
