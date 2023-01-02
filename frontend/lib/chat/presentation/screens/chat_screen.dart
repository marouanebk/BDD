import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/authentication/presentation/screens/register_page.dart';
import 'package:frontend/chat/domaine/entities/message_entity.dart';
import 'package:frontend/chat/presentation/controller/bloc/chat_bloc.dart';
import 'package:frontend/chat/presentation/screens/message_class.dart';
import 'package:frontend/cores/services/service_locator.dart';
import 'package:frontend/cores/utils/enums.dart';
import 'package:grouped_list/grouped_list.dart';

class ChatScreen extends StatefulWidget {
  final id;
  const ChatScreen({required this.id, super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message(
      text: 'hello ',
      date: DateTime.now().subtract(const Duration(minutes: 1)),
      isSentByMe: true,
    ),
    Message(
      text: '2 ',
      date: DateTime.now().subtract(const Duration(minutes: 2)),
      isSentByMe: false,
    ),
    Message(
      text: '3 ',
      date: DateTime.now().subtract(const Duration(minutes: 3)),
      isSentByMe: true,
    ),
    Message(
      text: 'he4llo ',
      date: DateTime.now().subtract(const Duration(minutes: 14)),
      isSentByMe: false,
    ),
    Message(
      text: 'helasdfasdflo ',
      date: DateTime.now().subtract(const Duration(minutes: 11)),
      isSentByMe: true,
    ),
    Message(
      text: 'heasdfasdfllo ',
      date: DateTime.now().subtract(const Duration(minutes: 12)),
      isSentByMe: false,
    ),
    Message(
      text: 'heasdfadfsllo ',
      date: DateTime.now().subtract(const Duration(minutes: 31)),
      isSentByMe: true,
    ),
    Message(
      text: 'hello ',
      date: DateTime.now().subtract(const Duration(minutes: 10)),
      isSentByMe: false,
    ),
  ].reversed.toList();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ChatBloc>()..add(GetMessagesEvent(widget.id)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.id),
        ),
        body: Column(
          children: [
            BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                switch (state.getMessagesState) {
                  case RequestState.loading:
                    return const Center(
                      child: LoadingWidget(),
                    );

                  case RequestState.loaded:
                    return Expanded(
                      child: GroupedListView<MessageEntity, DateTime>(
                        padding: const EdgeInsets.all(8),
                        elements: state.getMessages,
                        reverse: true,
                        order: GroupedListOrder.DESC,
                        groupBy: (message) => DateTime(2023),
                        groupHeaderBuilder: (MessageEntity message) =>
                            const SizedBox(),
                        itemBuilder: (context, MessageEntity message) => Align(
                          // alignment: message.isSentByMe
                          //     ? Alignment.centerRight
                          //     : Alignment.centerLeft,
                          alignment: Alignment.centerRight,
                          child: Card(
                            elevation: 8,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(message.message),
                            ),
                          ),
                        ),
                      ),
                    );

                  case RequestState.error:
                    return Text(state.getMessagesmessage);
                }
              },
            ),
            Container(
              color: Colors.grey.shade300,
              child: TextField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: "Type your message here",
                ),
                onSubmitted: (text) {
                  final message = Message(
                      text: text, date: DateTime.now(), isSentByMe: true);
                  setState(
                    () {
                      messages.add(message);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
