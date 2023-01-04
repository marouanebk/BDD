import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/MainScreen/presentation/screens/coursedetail.dart';
import 'package:frontend/MainScreen/presentation/screens/teacher/teacher_courses.dart';
import 'package:frontend/MainScreen/presentation/screens/teacher_detail.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_bloc.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_event.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_state.dart';
import 'package:frontend/authentication/presentation/screens/login_page.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:flutter/services.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/cores/services/service_locator.dart';
import 'package:frontend/profile/presentation/screens/edit_profile.dart';
import 'package:frontend/profile/presentation/screens/student_courses.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class ProfileScreen extends StatefulWidget {
  final numberP;
  final String userid;
  const ProfileScreen({required this.numberP, required this.userid, super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  String fullname = "";

  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  bool canUpload = false;
  String urlLink = "";
  //quizzzz

  void getuserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    fullname = prefs.getString("fullname")!;
  }

  @override
  void initState() {
    getuserName();
    print(widget.userid);
    super.initState();
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
    //
    final uuid = Uuid().v1();
    final path = 'profile_pictures/${uuid + pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snanpshot = await uploadTask!.whenComplete(() => {});
    final urlDownload = await snanpshot.ref.getDownloadURL();
    // log("download url $urlDownload");

    setState(() {
      urlLink = urlDownload;
    });
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");
    log(urlLink);
    final response = await Dio().put(
      "http://10.0.2.2:4000/users/setProfilePicture/$userid",
      data: {"link": urlLink},
      options: Options(
        followRedirects: false,
        validateStatus: (status) => true,
        headers: requestHeaders,
      ),
    );
    log(response.statusCode.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<UserBloc>()..add(const GetUserDetailsEvent(id: "userid")),
      child: BlocBuilder<UserBloc, UserBlocState>(
        builder: (context, state) {
          if (state is UserDetailState) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light.copyWith(
                  statusBarColor: Color(AppColors.blue),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: CustomShape(),
                        child: Container(
                          height: 220,
                          width: MediaQuery.of(context).size.width,
                          color: Color(AppColors.blue),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 60,
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: 128,
                                  width: 128,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: (state.usermodel.profilePicture !=
                                              null)
                                          ? NetworkImage(
                                              state.usermodel.profilePicture!,
                                            )
                                          : const NetworkImage(
                                              "https://picsum.photos/250?image=9",
                                            ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -10,
                                  left: 80,
                                  child: IconButton(
                                    onPressed: selectFile,
                                    // onPressed: SelectImage,
                                    icon: const Icon(
                                      Icons.add_a_photo,
                                      color: Colors.blue,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // BlocBuilder<UserBloc, UserBlocState>(
                            //   builder: (context, state) {
                            //     if (state is UserDetailState) {
                            //       return Text(
                            //         state.usermodel.fullname!,
                            //         style: TextStyle(
                            //           fontFamily: AppFonts.mainFont,
                            //           fontWeight: FontWeight.w600,
                            //           color: Color(AppColors.writting),
                            //           fontSize: 24,
                            //         ),
                            //       );
                            //     } else {
                            //       return Container();
                            //     }
                            //   },
                            // ),
                            Text(
                              state.usermodel.fullname!,
                              style: TextStyle(
                                fontFamily: AppFonts.mainFont,
                                fontWeight: FontWeight.w600,
                                color: Color(AppColors.writting),
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                reviewCard("09", "Courses started"),
                                const SizedBox(
                                  width: 20,
                                ),
                                reviewCard("30%", "Completed"),
                              ],
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            profileScreenList(context, widget.numberP),
                            BlocListener<UserBloc, UserBlocState>(
                              listener: (context, state) {
                                if (state is ErrorUserBlocState) {
                                } else if (state is SignOuState) {
                                  // Navigator.of(context).pushReplacement(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const LoginPage(),
                                  //   ),
                                  // );
                                  Navigator.of(context, rootNavigator: true)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()));
                                }
                              },
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget profileScreenList(context, numberP) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: [
          profileScreenCard(
            Icons.person,
            "Profile",
            "Edit the details of your profile ",
            EditProfileScreen(
              numberE: numberP,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          profileScreenCard(
            Icons.menu_book_sharp,
            "My Courses",
            "See all saved and studied courses",
            (numberP == 2) ? const TeacherCourses() : const StudentCourses(),
          ),
          const SizedBox(
            height: 10,
          ),
          profileScreenCardNoDesc(
            Icons.security,
            "Privacy Policies",
          ),
          const SizedBox(
            height: 10,
          ),
          profileScreenCardNoDesc(
            Icons.question_answer,
            "FAQs",
          ),
          const SizedBox(
            height: 10,
          ),
          logOutWidget(
            context,
            Icons.logout,
            "Log out",
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget profileScreenCard(icon, text1, text2, Widget link) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (_) => link,
          ),
        );
      },
      child: Container(
        height: 64,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            color: const Color(0xFFD9D9D9),
          ),
        ),
        padding: const EdgeInsets.only(right: 10, left: 23),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                icon,
                color: Color(AppColors.blue),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: TextStyle(
                      fontFamily: AppFonts.mainFont,
                      fontWeight: FontWeight.w600,
                      color: Color(AppColors.writting),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    text2,
                    style: TextStyle(
                      fontFamily: AppFonts.mainFont,
                      fontWeight: FontWeight.w600,
                      color: Color(AppColors.grey),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget profileScreenCardNoDesc(icon, text1) {
    return Container(
      height: 64,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          color: const Color(0xFFD9D9D9),
        ),
      ),
      padding: const EdgeInsets.only(right: 10, left: 23),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Icon(
              icon,
              color: Color(AppColors.blue),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Center(
            child: Text(
              text1,
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                fontWeight: FontWeight.w600,
                color: Color(AppColors.writting),
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget logOutWidget(context, icon, text1) {
    return GestureDetector(
      onTap: () {
        logout(context);
      },
      child: Container(
        height: 64,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            color: const Color(0xFFD9D9D9),
          ),
        ),
        padding: const EdgeInsets.only(right: 10, left: 23),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                icon,
                color: const Color(0xFFFF6868),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Center(
              child: Text(
                text1,
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w600,
                  color: Color(AppColors.writting),
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ))
          ],
        ),
      ),
    );
  }

  void logout(context) {
    log("in log out in profile screen");
    BlocProvider.of<UserBloc>(context).add(
      const LogOutUserEvent(),
    );
  }
}
