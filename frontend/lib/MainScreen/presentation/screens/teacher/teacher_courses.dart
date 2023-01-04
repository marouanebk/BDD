import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/MainScreen/presentation/controller/bloc/course_bloc.dart';
import 'package:frontend/MainScreen/presentation/screens/coursedetail.dart';
import 'package:frontend/MainScreen/presentation/screens/teacher/add_chapter.dart';
import 'package:frontend/MainScreen/presentation/screens/teacher/new_course.dart';
import 'package:frontend/authentication/presentation/screens/register_page.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/cores/services/service_locator.dart';
import 'package:frontend/cores/utils/enums.dart';

class TeacherCourses extends StatefulWidget {
  const TeacherCourses({super.key});

  @override
  State<TeacherCourses> createState() => _TeacherCoursesState();
}

class _TeacherCoursesState extends State<TeacherCourses> {
  // Future<String> getUserid() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final userid = prefs.getString("userid");
  //   log(userid.toString());

  //   setState(() {
  //     userid;
  //   });
  //   return userid!;
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     getUserid();
  //     setState(() {});
  //   });
  //   // getUserid();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CourseBloc>()..add(const GetCoursesByTeacherEvent("userid")),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 77, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back)),
                    const Text(
                      "My Courses",
                      style: TextStyle(
                        fontFamily: AppFonts.mainFont,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF111111),
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                BlocBuilder<CourseBloc, CourseState>(
                  builder: (context, state) {
                    switch (state.getCoursesByTeacherState) {
                      case RequestState.loading:
                        return const Center(
                          child: LoadingWidget(),
                        );

                      case RequestState.loaded:
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: teacherCourses(
                              context, state.getCoursesByTeacher),
                        );
                      case RequestState.error:
                        return Text(state.getCoursesByTeachermessage);
                    }
                  },
                ),
                // teacherCourses(context),
                const SizedBox(
                  height: 31,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(
                        AppColors.blue,
                      ),
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (_) => const NewCourse(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add),
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget teacherCourses(context, items) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => const SizedBox(
        height: 14,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return teacherCourseCard(context, items[index]);
      },
    );
  }

  Widget teacherCourseCard(context, index) {
    return GestureDetector(
      onTap: () => Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(
          builder: (_) => CourseDetailScreen(id: index.courseid),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 87,
        padding: const EdgeInsets.only(top: 15, left: 15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: const Color(0xFFD9D9D9),
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://picsum.photos/250?image=9",
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            RichText(
              text: TextSpan(
                text: index.title,
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w600,
                  color: Color(AppColors.writting),
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: index.year,
                    style: TextStyle(
                      fontFamily: AppFonts.mainFont,
                      fontWeight: FontWeight.w500,
                      color: Color(AppColors.greyWritting),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (_) => AddChapter(id: index.courseid),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    width: 25,
                    // decoration: const BoxDecoration(
                    //   shape: BoxShape.circle,
                    //   color: Colors.red,
                    // ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
