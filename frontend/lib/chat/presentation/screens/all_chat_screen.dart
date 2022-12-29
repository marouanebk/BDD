import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/MainScreen/presentation/controller/bloc/course_bloc.dart';
import 'package:frontend/MainScreen/presentation/screens/mainpage.dart';
import 'package:frontend/chat/presentation/screens/chat_page.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/cores/services/service_locator.dart';

class AllChatScreen extends StatefulWidget {
  const AllChatScreen({super.key});

  @override
  State<AllChatScreen> createState() => _AllChatScreenState();
}

class _AllChatScreenState extends State<AllChatScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CourseBloc>()..add(GetSuggestedCoursesEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 70, right: 10),
            child: Column(
              children: [
                searchBar(),
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
                chatHeads(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget chatHeads() {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => const SizedBox(
        height: 14,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return chatHeadCard(context);
      },
    ),
  );
}

Widget chatHeadCard(context) {
  return InkWell(
    onTap: () => Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => const ChatPage(),
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
              children: const [
                Text(
                  "some random message",
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0F1828),
                    fontSize: 16,
                  ),
                  // textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
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
