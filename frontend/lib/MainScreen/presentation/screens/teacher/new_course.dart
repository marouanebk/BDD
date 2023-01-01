import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/MainScreen/domaine/entities/course_content.dart';
import 'package:frontend/MainScreen/domaine/entities/course_detail_entity.dart';
import 'package:frontend/MainScreen/presentation/controller/bloc/course_bloc.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/cores/services/service_locator.dart';
import 'package:frontend/cores/widgets/text_input_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class NewCourse extends StatefulWidget {
  const NewCourse({super.key});

  @override
  State<NewCourse> createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  final TextEditingController _couresName = TextEditingController();
  final TextEditingController _couresYear = TextEditingController();
  final TextEditingController _couresDescription = TextEditingController();
  final TextEditingController _couresChapterName = TextEditingController();

  int index = 1;
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  String uploadState = "Upload PDF";
  bool canUpload = false;
  String urlLink = "";

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
    //
    final uuid = Uuid().v1();
    final path = 'courses/${uuid + pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    setState(() {
      uploadState = " Uploading PDF";
    });
    log(uploadState);
    final snanpshot = await uploadTask!.whenComplete(() => {});
    final urlDownload = await snanpshot.ref.getDownloadURL();
    log("download url $urlDownload");

    setState(() {
      uploadState = " PDF Uploaded";
      canUpload = true;
      urlLink = urlDownload;
    });
    log(uploadState);
  }

  Future uploadFile() async {
    final uuid = Uuid().v1();
    final path = 'courses/${uuid + pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    setState(() {
      uploadState = "Uploading PDF";
    });
    log(uploadState);
    final snanpshot = await uploadTask!.whenComplete(() => {});
    final urlDownload = await snanpshot.ref.getDownloadURL();
    log("download url $urlDownload");

    setState(() {
      uploadState = " PDF Uploaded";
    });
    log(uploadState);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CourseBloc>(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(top: 77, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        "New Course",
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
                  courseInfo(),
                  const SizedBox(
                    height: 18,
                  ),
                  //course content
                  courseContent(),
                  const SizedBox(
                    height: 20,
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        final userid = prefs.getString("userid");

                        final courseContent = CourseContent(
                            name: _couresName.text, type: "pdf", url: urlLink);
                        final courseCred = CourseDetails(
                            courseContent: [courseContent],
                            description: _couresDescription.text,
                            teacherId: userid!,
                            title: _couresName.text,
                            year: _couresYear.text);
                        log(courseContent.toString());

                        log(courseCred.toString());

                        // BlocProvider.of<UserBloc>(context).add(
                        //   LoginuserEvent(
                        //     user: userCred,
                        //   ),
                        // );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                          border: Border.all(
                            color: const Color(0xFFD9D9D9),
                          ),
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: Text(
                            "Publish Course",
                            style: TextStyle(
                              fontFamily: AppFonts.mainFont,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget courseInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Course Name",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w500,
            color: Color(AppColors.writting),
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(
              color: const Color(0xFFD9D9D9),
            ),
          ),
          child: TextFieldInput(
            hintText: "Enter course name",
            textEditingController: _couresName,
            textInputType: TextInputType.text,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Course Student Domaine",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w500,
            color: Color(AppColors.writting),
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(
              color: const Color(0xFFD9D9D9),
            ),
          ),
          child: TextFieldInput(
            hintText: "Enter your biography",
            textEditingController: _couresYear,
            textInputType: TextInputType.text,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Course Into",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w500,
            color: Color(AppColors.writting),
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(
              color: const Color(0xFFD9D9D9),
            ),
          ),
          child: TextFieldInput(
            hintText: "Enter course into",
            textEditingController: _couresDescription,
            textInputType: TextInputType.text,
          ),
        ),
      ],
    );
  }

  Widget courseContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Course Content",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w700,
            color: Color(AppColors.writting),
            fontSize: 20,
          ),
        ),
        Text(
          "Course name",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w500,
            color: Color(AppColors.writting),
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(
              color: const Color(0xFFD9D9D9),
            ),
          ),
          child: TextFieldInput(
            hintText: "Enter chapter name",
            textEditingController: _couresChapterName,
            textInputType: TextInputType.text,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "chapter type",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w500,
            color: Color(AppColors.writting),
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),

        //row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
              child: Container(
                height: 41,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                      color: (index == 1)
                          ? Color(AppColors.blue)
                          : const Color(0xFFBEC5D1),
                      width: (index == 1) ? 2 : 1),
                ),
                child: Center(
                  child: Text(
                    "PDF",
                    style: TextStyle(
                      fontFamily: AppFonts.mainFont,
                      fontWeight: FontWeight.w500,
                      color: (index == 1)
                          ? Color(AppColors.blue)
                          : Color(AppColors.writting),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  index = 2;
                });
              },
              child: Container(
                height: 41,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                      color: (index == 2)
                          ? Color(AppColors.blue)
                          : const Color(0xFFBEC5D1),
                      width: (index == 2) ? 2 : 1),
                ),
                child: Center(
                  child: Text(
                    "QUIZ",
                    style: TextStyle(
                      fontFamily: AppFonts.mainFont,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: (index == 2)
                          ? Color(AppColors.blue)
                          : Color(AppColors.writting),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        GestureDetector(
          onTap: selectFile,
          child: Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(
                color: const Color(0xFFD9D9D9),
              ),
            ),
            child: Center(
              child: Text(
                uploadState,
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w600,
                  color: Color(AppColors.blue),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildProfress() => StreamBuilder<TaskSnapshot>(
        stream: uploadTask?.snapshotEvents,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            double progress = data.bytesTransferred / data.totalBytes;
            return const SizedBox();
          } else {
            return const SizedBox();
          }
        }),
      );
}
