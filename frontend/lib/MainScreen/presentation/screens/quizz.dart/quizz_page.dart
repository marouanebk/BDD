import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/MainScreen/domaine/entities/course_content.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';

class QuizzPage extends StatefulWidget {
  final List<Quizz> items;
  const QuizzPage({required this.items, super.key});

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  final controller = PageController(initialPage: 0);
  int pageindex = 0;
  int index = -1;
  int pageIndex = 0;
  int points = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  refresh() {
    log("something");
    controller.animateToPage(2,
        duration: const Duration(seconds: 1), curve: Curves.ease);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(top: 77, left: 20, right: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back)),
              ),
              const Text(
                "Quiz 1",
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "BDD Course",
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w500,
                  color: Color(AppColors.writting),
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Expanded(
                // child: SizedBox(
                // height: 600,
                child: PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    log("page ${index + 1} ");
                    pageindex = index;
                    setState(() {
                      index;
                    });
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    for (var i = 0; i < widget.items.length; i++)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 50,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(46),
                              ),
                              color: Color(AppColors.blue),
                            ),
                            child: Center(
                              child: Text(
                                "Q $i",
                                style: const TextStyle(
                                  fontFamily: AppFonts.mainFont,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.items[i].question!,
                            style: TextStyle(
                              fontFamily: AppFonts.mainFont,
                              fontWeight: FontWeight.w500,
                              color: Color(AppColors.writting),
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                index = 0;
                              });
                              // widget.notifyParent;
                              log("notified");
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              padding: const EdgeInsets.only(
                                  top: 20, left: 17, right: 13),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  color: (index == 0)
                                      ? Color(AppColors.blue)
                                      : const Color(0xFFD9D9D9),
                                ),
                              ),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "A - ${widget.items[i].answers![0]}",
                                    style: TextStyle(
                                      fontFamily: AppFonts.mainFont,
                                      fontWeight: FontWeight.w600,
                                      color: Color(AppColors.writting),
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.check_circle,
                                    color: (index == 0)
                                        ? Color(AppColors.blue)
                                        : Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                index = 1;
                              });
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              padding: const EdgeInsets.only(
                                  top: 20, left: 17, right: 13),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  color: (index == 1)
                                      ? Color(AppColors.blue)
                                      : const Color(0xFFD9D9D9),
                                ),
                              ),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "B - ${widget.items[i].answers![1]}",
                                    style: TextStyle(
                                      fontFamily: AppFonts.mainFont,
                                      fontWeight: FontWeight.w600,
                                      color: Color(AppColors.writting),
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.check_circle,
                                    color: (index == 1)
                                        ? Color(AppColors.blue)
                                        : Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                index = 2;
                              });
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              padding: const EdgeInsets.only(
                                  top: 20, left: 17, right: 13),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  color: (index == 2)
                                      ? Color(AppColors.blue)
                                      : const Color(0xFFD9D9D9),
                                ),
                              ),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "C - ${widget.items[i].answers![2]}",
                                    style: TextStyle(
                                      fontFamily: AppFonts.mainFont,
                                      fontWeight: FontWeight.w600,
                                      color: Color(AppColors.writting),
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.check_circle,
                                    color: (index == 2)
                                        ? Color(AppColors.blue)
                                        : Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                index = 3;
                              });
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              padding: const EdgeInsets.only(
                                  top: 20, left: 17, right: 13),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  color: (index == 3)
                                      ? Color(AppColors.blue)
                                      : const Color(0xFFD9D9D9),
                                ),
                              ),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "D - ${widget.items[i].answers![3]}",
                                    style: TextStyle(
                                      fontFamily: AppFonts.mainFont,
                                      fontWeight: FontWeight.w600,
                                      color: Color(AppColors.writting),
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.check_circle,
                                    color: (index == 3)
                                        ? Color(AppColors.blue)
                                        : Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              if (index != -1) {
                                if (index ==
                                    int.parse(widget.items[i].rightAnswer!)) {
                                  setState(() {
                                    points += 1;
                                  });
                                }
                                setState(() {
                                  index = -1;
                                  pageIndex +=1;
                                });

                                controller.animateToPage(pageIndex + 1,
                                    duration: const Duration(milliseconds: 75),
                                    curve: Curves.ease);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 45,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    color: (index == -1)
                                        ? Colors.white
                                        : Color(AppColors.blue),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Next Question ",
                                      style: TextStyle(
                                        fontFamily: AppFonts.mainFont,
                                        fontWeight: FontWeight.w600,
                                        color: (index == -1)
                                            ? Color(AppColors.blue)
                                            : Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    quizzEnd(points, widget.items.length, context),
                  ],
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     if (index != -1) {
              //       controller.animateToPage(pageIndex + 1,
              //           duration: const Duration(seconds: 1), curve: Curves.ease);
              //     }
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(bottom: 20),
              //     child: Align(
              //       alignment: Alignment.bottomCenter,
              //       child: Container(
              //         height: 45,
              //         width: double.infinity,
              //         decoration: BoxDecoration(
              //           borderRadius: const BorderRadius.all(
              //             Radius.circular(5),
              //           ),
              //           color:
              //               (index == -1) ? Colors.white : Color(AppColors.blue),
              //         ),
              //         child: Center(
              //           child: Text(
              //             "Next Question ",
              //             style: TextStyle(
              //               fontFamily: AppFonts.mainFont,
              //               fontWeight: FontWeight.w600,
              //               color: (index == -1)
              //                   ? Color(AppColors.blue)
              //                   : Colors.white,
              //               fontSize: 17,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      }),
    );
  }

  Widget quizzEnd(points, questions, context) {
    return Column(
      children: [
        Text(
          "Your Score is ",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w600,
            color: Color(AppColors.writting),
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          height: 184,
          width: 184,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(
              AppColors.blue,
            ),
          ),
          child: Center(
            child: Text(
              "$points / $questions",
              style: const TextStyle(
                fontFamily: AppFonts.mainFont,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 48,
              ),
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop;
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: Color(AppColors.blue),
                ),
                child: const Center(
                  child: Text(
                    "Go back to courses ",
                    style: TextStyle(
                      fontFamily: AppFonts.mainFont,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
