import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/MainScreen/domaine/entities/course_content.dart';
import 'package:frontend/MainScreen/presentation/component/add_course_success.dart';
import 'package:frontend/MainScreen/presentation/controller/bloc/course_bloc.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/cores/services/service_locator.dart';
import 'package:frontend/cores/utils/enums.dart';
import 'package:frontend/cores/widgets/text_input_field.dart';
import 'package:uuid/uuid.dart';

class AddChapter extends StatefulWidget {
  final String id;
  const AddChapter({required this.id, super.key});

  @override
  State<AddChapter> createState() => _AddChapterState();
}

class _AddChapterState extends State<AddChapter> {
  final TextEditingController _couresChapterName = TextEditingController();

  int index = 1;
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  String uploadState = "Upload PDF";
  bool canUpload = false;
  String urlLink = "";
  //quizzzz
  int numberofQuiz = 1;

  int row = 3;
  int col = 4;

  var _controller = List.generate(
      10, (i) => List.generate(6, (j) => TextEditingController()));

  List<int> _answers = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) _answers[i] = 0;

    log(_controller[1][1].toString());
  }

  Future selectFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
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
    final snanpshot = await uploadTask!.whenComplete(() => {});
    final urlDownload = await snanpshot.ref.getDownloadURL();
    // log("download url $urlDownload");

    setState(() {
      uploadState = " PDF Uploaded";
      canUpload = true;
      urlLink = urlDownload;
    });
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
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CourseBloc>(),
      child: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
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
                          "New Chapter",
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

                    //course content
                    courseContent(),
                    const SizedBox(
                      height: 20,
                    ),

                    if (state.addcourseState == RequestState.error)
                      Text(
                        state.addCourseMessage,
                        style: const TextStyle(color: Colors.red),
                      ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () async {
                          String type = "";
                          if (index == 1) {
                            type = "pdf";
                          } else if (index == 2) {
                            type = "quizz";
                          }
                          if (index == 2) {
                            List<Quizz> quizzContent = [];
                            for (int i = 0; i < numberofQuiz; i++) {
                              List<String> answers = [
                                _controller[i][1].text,
                                _controller[i][2].text,
                                _controller[i][3].text,
                                _controller[i][4].text
                              ];
                              quizzContent.add(Quizz(
                                question: _controller[i][0].text,
                                answers: answers,
                                rightAnswer: _answers[i].toString(),
                              ));
                            }
                            CourseContent course = CourseContent(
                                name: _couresChapterName.text,
                                type: type,
                                quizzContent: quizzContent);

                            BlocProvider.of<CourseBloc>(context).add(
                              AddChapterEvent(course, widget.id),
                            );

                            // log(course.toString());

                            // BlocProvider.of<CourseBloc>(context).add(
                            //   AddCourseEvent(courseCred),
                            // );
                          } else {
                            CourseContent course = CourseContent(
                                name: _couresChapterName.text,
                                type: type,
                                url: urlLink);
                            log(course.toString());
                            log(widget.id);

                            BlocProvider.of<CourseBloc>(context).add(
                              AddChapterEvent(course, widget.id),
                            );

                            // final courseContent = CourseContent(
                            //     name: _couresName.text, type: "pdf", url: urlLink);
                            // final courseCred = CourseDetails(
                            //     courseContent: course,
                            //     description: _couresDescription.text,
                            //     teacherId: userid!,
                            //     title: _couresName.text,
                            //     year: _couresYear.text);
                            // BlocProvider.of<CourseBloc>(context).add(
                            //   AddCourseEvent(courseCred),
                            // );
                          }
                          // BlocProvider.of<CourseBloc>(context).add(
                          //   AddCourseEvent(courseCred),
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

                    BlocListener<CourseBloc, CourseState>(
                      listener: (context, state) {
                        switch (state.addCourseSuccess) {
                          case false:
                            break;
                          case true:
                            log("true");
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (_) => const CourseAddSuccess(),
                              ),
                            );
                        }
                      },
                      child: const SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
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
          "Chapter name",
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
        if (index == 1)
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
        if (index == 2)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < numberofQuiz; i++) quiz(i),
              GestureDetector(
                onTap: () {
                  setState(() {
                    numberofQuiz += 1;
                  });
                },
                child: Text(
                  "Add Quiz Question",
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w500,
                    color: Color(AppColors.blue),
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              GestureDetector(
                onTap: () {
                  if (numberofQuiz != 1) {
                    setState(() {
                      numberofQuiz -= 1;
                    });
                  }
                },
                child: const Text(
                  "remove quizz ",
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          )
      ],
    );
  }

  Widget quiz(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quiz Question",
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
            textEditingController: _controller[index][0],
            textInputType: TextInputType.text,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Quiz Answers",
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
            hintText: "Enter Quiz's Answer A",
            textEditingController: _controller[index][1],
            textInputType: TextInputType.text,
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
            hintText: "Enter Quiz's Answer B",
            textEditingController: _controller[index][2],
            textInputType: TextInputType.text,
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
            hintText: "Enter Quiz's Answer C",
            textEditingController: _controller[index][3],
            textInputType: TextInputType.text,
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
            hintText: "Enter Quiz's Answer D",
            textEditingController: _controller[index][4],
            textInputType: TextInputType.text,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Quiz Right Answer",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w500,
            color: Color(AppColors.writting),
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _answers[index] = 1;
                });
              },
              child: Container(
                height: 28,
                width: 60,
                padding: const EdgeInsets.symmetric(horizontal: 7),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(33),
                  ),
                  border: Border.all(
                    color: const Color(0xFFD9D9D9),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      "A",
                      style: TextStyle(
                        fontFamily: AppFonts.mainFont,
                        fontWeight: FontWeight.w500,
                        color: (_answers[index] == 1)
                            ? Color(AppColors.blue)
                            : Color(AppColors.writting),
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.check_circle,
                      size: 20,
                      color: (_answers[index] == 1)
                          ? Color(AppColors.blue)
                          : Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _answers[index] = 2;
                });
              },
              child: Container(
                height: 28,
                width: 60,
                padding: const EdgeInsets.symmetric(horizontal: 7),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(33),
                  ),
                  border: Border.all(
                    color: const Color(0xFFD9D9D9),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      "B",
                      style: TextStyle(
                        fontFamily: AppFonts.mainFont,
                        fontWeight: FontWeight.w500,
                        color: (_answers[index] == 2)
                            ? Color(AppColors.blue)
                            : Color(AppColors.writting),
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.check_circle,
                      size: 20,
                      color: (_answers[index] == 2)
                          ? Color(AppColors.blue)
                          : Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _answers[index] = 3;
                });
              },
              child: Container(
                height: 28,
                width: 60,
                padding: const EdgeInsets.symmetric(horizontal: 7),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(33),
                  ),
                  border: Border.all(
                    color: const Color(0xFFD9D9D9),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      "C",
                      style: TextStyle(
                        fontFamily: AppFonts.mainFont,
                        fontWeight: FontWeight.w500,
                        color: (_answers[index] == 3)
                            ? Color(AppColors.blue)
                            : Color(AppColors.writting),
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.check_circle,
                      size: 20,
                      color: (_answers[index] == 3)
                          ? Color(AppColors.blue)
                          : Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _answers[index] = 4;
                });
              },
              child: Container(
                height: 28,
                width: 60,
                padding: const EdgeInsets.symmetric(horizontal: 7),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(33),
                  ),
                  border: Border.all(
                    color: const Color(0xFFD9D9D9),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      "D",
                      style: TextStyle(
                        fontFamily: AppFonts.mainFont,
                        fontWeight: FontWeight.w500,
                        color: (_answers[index] == 4)
                            ? Color(AppColors.blue)
                            : Color(AppColors.writting),
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.check_circle,
                      size: 20,
                      color: (_answers[index] == 4)
                          ? Color(AppColors.blue)
                          : Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
          ],
        ),
      ],
    );
  }

  // Widget buildProfress() => StreamBuilder<TaskSnapshot>(
  //       stream: uploadTask?.snapshotEvents,
  //       builder: ((context, snapshot) {
  //         if (snapshot.hasData) {
  //           final data = snapshot.data!;
  //           double progress = data.bytesTransferred / data.totalBytes;
  //           return const SizedBox();
  //         } else {
  //           return const SizedBox();
  //         }
  //       }),
  //     );
}
