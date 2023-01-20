import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/authentication/presentation/screens/register_page.dart';
import 'package:frontend/chat/data/model/message_model.dart';
import 'package:frontend/chat/domaine/entities/message_entity.dart';
import 'package:frontend/chat/presentation/controller/bloc/chat_bloc.dart';
import 'package:frontend/cores/network/api_constants.dart';
import 'package:frontend/cores/services/service_locator.dart';
import 'package:frontend/cores/utils/enums.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

IO.Socket? socket;

class ChatScreen extends StatefulWidget {
  final String id;
  final String userid;
  final String receiver;
  const ChatScreen(
      {required this.userid,
      required this.id,
      required this.receiver,
      super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool refresh = false;
  List<MessageModel> messages = [];

  Stream<List<MessageModel>> getMessages(courseId) async* {
    final response = await Dio().get(
      ApiConstance.getMessage(courseId),
    );

    yield List<MessageModel>.from(
        (response.data['result'] as List).map((e) => MessageModel.fromJson(e)));
  }

  getMessages2(courseId) async* {
    final response = await Dio().get(
      ApiConstance.getMessage(courseId),
    );

    messages = List<MessageModel>.from(
        (response.data['result'] as List).map((e) => MessageModel.fromJson(e)));
    setState(() {
      messages;
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMessages2(widget.id);
    connect();
    log("userid in chat screen ${widget.userid} ");
  }

  void connect() {
    // IO.Socket socket = IO.io('http://localhost:4000', <String, dynamic>{
    //   "transports": ["websocket"],
    //   // "autoConnect": false,
    // });
    log("before connecting");
    socket = IO.io("http://10.0.2.2:4000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket!.connect();
    socket!.onConnect((_) {});
    socket!.emit('add-user', widget.userid);
    socket!.on("msg-recieve", (data) {
      refresh = true;
      log("message reciever $data");

      setState(() {
        refresh = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ChatBloc>()..add(GetMessagesEvent(widget.id)),
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.id),
            ),
            body: BlocListener<ChatBloc, ChatState>(
              listener: (context, state) {
                socket!.on("msg-recieve", (data) {
                  log("IN BLOOOCK LISTENER NOOBS $data");

                  // MessageEntity messageEntity = MessageEntity(
                  //     conversationId: data.conversation,
                  //     sender: data.from,
                  //     message: data.message);
                  // log(" eentity ${data.message.toString()}");
                  log("DAAAAAAATAAAAAAAAA");
                  log(jsonDecode(data));

                  // state.getMessages.add(data);

                  setState(() {});
                });
              },
              child: BlocBuilder<ChatBloc, ChatState>(
                buildWhen: (previous, current) =>
                    previous.getMessages != current.getMessages,
                builder: (context, state) {
                  switch (state.getMessagesState) {
                    case RequestState.loading:
                      return const Center(
                        child: LoadingWidget(),
                      );

                    case RequestState.loaded:
                      return Column(
                        children: [
                          StreamBuilder(
                              stream: getMessages(widget.id),
                              builder: (context, snapchot) {
                                if (snapchot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else {
                                  return Expanded(
                                    child: GroupedListView<MessageEntity,
                                        DateTime>(
                                      padding: const EdgeInsets.all(8),
                                      elements: state.getMessages,
                                      reverse: true,
                                      order: GroupedListOrder.DESC,
                                      groupBy: (message) => DateTime(2023),
                                      groupHeaderBuilder:
                                          (MessageEntity message) =>
                                              const SizedBox(),
                                      itemBuilder:
                                          (context, MessageEntity message) =>
                                              Align(
                                        alignment:
                                            (message.sender == widget.userid)
                                                ? Alignment.centerRight
                                                : Alignment.centerLeft,
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
                                }
                              }),

                          // Expanded(
                          //   child: GroupedListView<MessageEntity, DateTime>(
                          //     padding: const EdgeInsets.all(8),
                          //     elements: state.getMessages,
                          //     reverse: true,
                          //     order: GroupedListOrder.DESC,
                          //     groupBy: (message) => DateTime(2023),
                          //     groupHeaderBuilder: (MessageEntity message) =>
                          //         const SizedBox(),
                          //     itemBuilder: (context, MessageEntity message) =>
                          //         Align(
                          //       alignment: (message.sender == widget.userid)
                          //           ? Alignment.centerRight
                          //           : Alignment.centerLeft,
                          //       child: Card(
                          //         elevation: 8,
                          //         child: Padding(
                          //           padding: const EdgeInsets.all(12),
                          //           child: Text(message.message),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          Container(
                            color: Colors.grey.shade300,
                            child: TextField(
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(12),
                                hintText: "Type your message here",
                              ),
                              onSubmitted: (text) {
                                final message = MessageModel(
                                    conversationId: widget.id,
                                    sender: widget.userid,
                                    message: text,
                                    to: widget.receiver);
                                // log("userid :  ${widget.userid}");
                                socket!.emit("send-msg", message);
                                BlocProvider.of<ChatBloc>(context)
                                    .add(SendMessageEvent(message));

                                BlocProvider.of<ChatBloc>(context)
                                    .add(GetMessagesEvent(widget.id));
                                setState(() {
                                  state.getMessages.add(message);
                                });

                                // final message = Message(
                                //     text: text, date: DateTime.now(), isSentByMe: true);
                                // setState(
                                //   () {
                                //     messages.add(message);
                                //   },
                                // );
                              },
                            ),
                          ),
                        ],
                      );

                    case RequestState.error:
                      return Text(state.getMessagesmessage);
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
