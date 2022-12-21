import 'package:flutter/material.dart';
import 'package:frontend/cores/const/colors.dart';

import 'package:frontend/cores/const/const.dart';

class ToDos extends StatefulWidget {
  const ToDos({super.key});

  @override
  State<ToDos> createState() => _ToDosState();
}

class _ToDosState extends State<ToDos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "To-Dos",
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F1828),
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                "Undone - 2",
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w600,
                  color: Color(AppColors.blue),
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              unDone(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Done - 6",
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w600,
                  color: Color(AppColors.blue),
                  fontSize: 18,
                ),
              ),
              done(),
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
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}

Widget unDone() {
  return ListView.separated(
    scrollDirection: Axis.vertical,
    separatorBuilder: (context, index) => const SizedBox(
      height: 14,
    ),
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: 2,
    itemBuilder: (context, index) {
      return unDoneCard();
    },
  );
}

Widget done() {
  return ListView.separated(
    scrollDirection: Axis.vertical,
    separatorBuilder: (context, index) => const SizedBox(
      height: 14,
    ),
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: 5,
    itemBuilder: (context, index) {
      return doneCard();
    },
  );
}

Widget unDoneCard() {
  return Container(
    height: 60,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      border: Border.all(
        color: const Color(0xFFD9D9D9),
      ),
    ),
    padding: const EdgeInsets.only(top: 13, left: 18, right: 13),
    child: Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Read two chapters of BDD Course",
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                fontWeight: FontWeight.w500,
                color: Color(AppColors.blue),
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "Due Today",
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                fontWeight: FontWeight.w500,
                color: Color(AppColors.grey),
                fontSize: 12,
              ),
            ),
          ],
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 18,
              width: 18,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.red),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget doneCard() {
  return Container(
    height: 48,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      border: Border.all(
        color: Color(AppColors.blue),
      ),
    ),
    padding: const EdgeInsets.only(right: 15, left: 18, top: 15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Read two chapters of BDD Course",
          style: TextStyle(
              fontFamily: AppFonts.mainFont,
              fontWeight: FontWeight.w500,
              color: Color(AppColors.writting),
              fontSize: 16,
              decoration: TextDecoration.lineThrough),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(AppColors.blue)),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
