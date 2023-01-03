part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final List<ConversationEntity> getAllConversations;
  final RequestState getAllConversationsState;
  final String getAllConversationsmessage;

  final RequestState addConversationState;
  final String addCovnersationmessage;
  final bool addCovnersationSuccess;

  final List<MessageEntity> getMessages;
  final RequestState getMessagesState;
  final String getMessagesmessage;

  // final RequestState sendMessageState;
  // final String sendMessagemessage;
  final bool addMessageSucess;

  const ChatState({
    this.getAllConversations = const [],
    this.getAllConversationsState = RequestState.loading,
    this.getAllConversationsmessage = "",
    //
    this.getMessages = const [],
    this.getMessagesState = RequestState.loading,
    this.getMessagesmessage = "",
    //
    this.addConversationState = RequestState.loading,
    this.addCovnersationmessage = '',
    this.addCovnersationSuccess = false,
    this.addMessageSucess = false,
  });

  ChatState copyWith({
    List<ConversationEntity>? getAllConversations,
    RequestState? getAllConversationsState,
    String? getAllConversationsmessage,
    RequestState? addConversationState,
    String? addCovnersationmessage,
    bool? addCovnersationSuccess,
    List<MessageEntity>? getMessages,
    RequestState? getMessagesState,
    String? getMessagesmessage,
    //bool
    bool? addMessageSucess,
  }) {
    return ChatState(
      getAllConversations: getAllConversations ?? this.getAllConversations,
      getAllConversationsState:
          getAllConversationsState ?? this.getAllConversationsState,
      getAllConversationsmessage:
          getAllConversationsmessage ?? this.getAllConversationsmessage,
      addConversationState: addConversationState ?? this.addConversationState,
      addCovnersationmessage:
          addCovnersationmessage ?? this.addCovnersationmessage,
      addCovnersationSuccess:
          addCovnersationSuccess ?? this.addCovnersationSuccess,
      //
      getMessages: getMessages ?? this.getMessages,
      getMessagesState: getMessagesState ?? this.getMessagesState,
      getMessagesmessage: getMessagesmessage ?? this.getMessagesmessage,
      addMessageSucess: addMessageSucess ?? this.addMessageSucess,
    );
  }

  @override
  List<Object?> get props => [
        getAllConversations,
        getAllConversationsState,
        getAllConversationsmessage,
        //
        addConversationState,
        addCovnersationmessage,
        addCovnersationSuccess,
        //
        getMessages,
        getMessagesState,
        getMessagesmessage,
        //
        addMessageSucess
      ];
}
