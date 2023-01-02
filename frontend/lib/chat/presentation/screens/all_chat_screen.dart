import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/MainScreen/presentation/controller/bloc/course_bloc.dart';
import 'package:frontend/authentication/presentation/screens/register_page.dart';
import 'package:frontend/chat/presentation/controller/bloc/chat_bloc.dart';
import 'package:frontend/chat/presentation/screens/chat_page.dart';
import 'package:frontend/chat/presentation/screens/chat_screen.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/cores/services/service_locator.dart';
import 'package:frontend/cores/utils/enums.dart';
import 'package:frontend/cores/widgets/text_input_field.dart';

class AllChatScreen extends StatefulWidget {
  final id;
  const AllChatScreen({required this.id, super.key});

  @override
  State<AllChatScreen> createState() => _AllChatScreenState();
}

class _AllChatScreenState extends State<AllChatScreen> {
  @override
  void initState() {
    super.initState();
    log(widget.id);
  }

  TextEditingController _searchchat = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ChatBloc>()..add(GetAllConversationsEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 70, right: 10),
            child: Column(
              children: [
                searchBar(context),
                const SizedBox(
                  height: 23,
                ),
                //main inbox text
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 3,
                        color: Color(AppColors.blue),
                      ),
                    ),
                  ),
                  child: Text(
                    "Main inbox",
                    style: TextStyle(
                      fontFamily: AppFonts.mainFont,
                      fontWeight: FontWeight.w600,
                      color: Color(AppColors.blue),
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // all chat
                BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state) {
                    switch (state.getAllConversationsState) {
                      case RequestState.loading:
                        return const Center(
                          child: LoadingWidget(),
                        );

                      case RequestState.loaded:
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child:
                              chatHeads(state.getAllConversations, widget.id),
                        );

                      case RequestState.error:
                        return Text(state.getAllConversationsmessage);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchBar(context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: const Color(0xFFBEC5D1),
          ),
          color: Colors.white,
        ),
        child: TextFieldInput(
          hintText: "seach here",
          textEditingController: _searchchat,
          textInputType: TextInputType.text,
        ),
      ),
    );
  }
}

Widget chatHeads(items, userid) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => const SizedBox(
        height: 14,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return chatHeadCard(context, items[index], userid);
      },
    ),
  );
}

Widget chatHeadCard(context, item, userid) {
  return InkWell(
    onTap: () => Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => ChatScreen(id: item.conversationId),
      ),
    ),
    child: SizedBox(
      width: double.infinity,
      height: 56,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                border: Border.all(
                  color: const Color(0xFFBEC5D1),
                ),
                color: Colors.orange,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (item.sender == userid) ? item.reciever : item.sender,
                  style: const TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0F1828),
                    fontSize: 16,
                  ),
                  // textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  "Projet BDD",
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFADB5BD),
                    fontSize: 12,
                  ),
                  // textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  "12:20 am",
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFA4A4A4),
                    fontSize: 12,
                  ),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
