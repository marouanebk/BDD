import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_bloc.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_event.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_state.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/cores/services/service_locator.dart';
import 'package:frontend/cores/widgets/text_input_field.dart';
import 'package:frontend/profile/presentation/component/bio_success_page.dart';

class BioGraphyPage extends StatefulWidget {
  const BioGraphyPage({super.key});

  @override
  State<BioGraphyPage> createState() => _BioGraphyPageState();
}

class _BioGraphyPageState extends State<BioGraphyPage> {
  final TextEditingController _biography = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserBloc>(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
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
                      "Update Biography",
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
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Biography:",
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
                  height: 244,
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
                    textEditingController: _biography,
                    textInputType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    addBiography(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: Color(AppColors.blue)),
                    child: const Center(
                      child: Text(
                        "Update Biography",
                        style: TextStyle(
                          fontFamily: AppFonts.mainFont,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                BlocListener<UserBloc, UserBlocState>(
                  listener: (context, state) {
                    if (state is ErrorUserBlocState) {
                    } else if (state is BioSuccessState) {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (context) => const LoginPage(),
                      //   ),
                      // );
                      Navigator.of(context, rootNavigator: true)
                          .pushReplacement(MaterialPageRoute(
                              builder: (context) => const BioSuccess()));
                    }
                  },
                  child: Container(),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  void addBiography(context) {
    BlocProvider.of<UserBloc>(context)
        .add(SetBiographyEvent(bio: _biography.text));
  }
}
