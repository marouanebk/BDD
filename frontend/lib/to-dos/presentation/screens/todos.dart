import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/authentication/presentation/screens/register_page.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/cores/services/service_locator.dart';
import 'package:frontend/cores/utils/enums.dart';
import 'package:frontend/cores/widgets/text_input_field.dart';
import 'package:frontend/to-dos/domaine/entities/to_do_entity.dart';
import 'package:frontend/to-dos/presentation/controller/todo_bloc/todo_bloc.dart';
import 'package:frontend/to-dos/presentation/controller/todo_bloc/todo_event.dart';
import 'package:frontend/to-dos/presentation/controller/todo_bloc/todo_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDos extends StatefulWidget {
  const ToDos({super.key});

  @override
  State<ToDos> createState() => _ToDosState();
}

class _ToDosState extends State<ToDos> {
  final TextEditingController _todo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TodoBloc>()
        ..add(GetDoneTodoEvent())
        ..add(GetUnDoneTodoEvent()),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.white,
            ),
            child: SingleChildScrollView(
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
                    unDone(context),
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
                    done(context),
                    const SizedBox(
                      height: 31,
                    ),
                    //add button
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
                              showModalBottomSheet<dynamic>(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom *
                                        1,
                                  ),
                                  child: addBottomSheet(context),
                                ),
                              );
                            },
                            icon: const Icon(Icons.add),
                            color: Colors.white),
                      ),
                    ),
                    BlocListener<TodoBloc, TodoState>(
                      listener: (context, state) {
                        switch (state.addTodoState) {
                          case RequestState.loading:
                            log("loading adding state");
                            break;
                          case RequestState.loaded:
                            log("loaded adding state");
                            setState(() {});
                            setState(() {});
                            break;
                          case RequestState.error:
                            log("error adding state ");
                            break;
                        }
                      },
                      child: Container(),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget unDone(context) {
    return BlocBuilder<TodoBloc, TodoState>(
      buildWhen: (previous, current) =>
          previous.getUnDoneTodoState != current.getUnDoneTodoState,
      builder: (context, state) {
        switch (state.getUnDoneTodoState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );

          case RequestState.loaded:
            return ListView.separated(
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) => const SizedBox(
                height: 14,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.getUnDoneTodo.length,
              itemBuilder: (context, index) {
                return unDoneCard(state.getUnDoneTodo[index]);
              },
            );

          case RequestState.error:
            return Text(state.getUnDoneTodomessage);
        }
      },
    );
  }

  Widget done(context) {
    return BlocBuilder<TodoBloc, TodoState>(
      buildWhen: (previous, current) =>
          previous.addTodoState != current.addTodoState,
      builder: (context, state) {
        switch (state.getDoneTodoState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          case RequestState.loaded:
            return ListView.separated(
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) => const SizedBox(
                height: 14,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.getDoneTodo.length,
              itemBuilder: (context, index) {
                return doneCard(state.getDoneTodo[index]);
              },
            );
          case RequestState.error:
            return Text(state.getDoneTodomessage);
        }
      },
    );
  }

  Widget unDoneCard(item) {
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
                item.todo,
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

  Widget doneCard(item) {
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
            item.todo,
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

  Widget addBottomSheet(context) {
    return Builder(
      builder: (context) {
        return Container(
            width: double.infinity,
            height: 220,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 3,
                            color: Color(AppColors.writting),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //text
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Your To-do",
                    style: TextStyle(
                      fontFamily: AppFonts.mainFont,
                      fontWeight: FontWeight.w600,
                      color: Color(AppColors.writting),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),

                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        color: const Color(0xFFD9D9D9),
                      ),
                    ),
                    child: TextFieldInput(
                      hintText: "Your todo",
                      textEditingController: _todo,
                      textInputType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          addTodo(context);
                          setState(() {});
                        },
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            color: Color(AppColors.blue),
                          ),
                          child: const Center(
                            child: Text(
                              "Add to-do",
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
                      // Spacer(),
                      Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.red,
                        ),
                        child: const Center(
                          child: Text(
                            "Delete to-do",
                            style: TextStyle(
                              fontFamily: AppFonts.mainFont,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ));
      }
    );
  }

  void addTodo(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");

    final todo = ToDo(
      userid: userid,
      todo: _todo.text,
      status: "Undone",
    );
    BlocProvider.of<TodoBloc>(context).add(AddTodoEvent(todo: todo));
    BlocProvider.of<TodoBloc>(context).add(GetDoneTodoEvent());
    BlocProvider.of<TodoBloc>(context).add(GetUnDoneTodoEvent());

    setState(() {});
  }
}
