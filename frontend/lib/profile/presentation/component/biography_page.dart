import 'package:flutter/material.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/cores/widgets/text_input_field.dart';

class BioGraphyPage extends StatefulWidget {
  const BioGraphyPage({super.key});

  @override
  State<BioGraphyPage> createState() => _BioGraphyPageState();
}

class _BioGraphyPageState extends State<BioGraphyPage> {
  final TextEditingController _biography = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    }, icon: const Icon(Icons.arrow_back)),
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
          ],
        ),
      ),
    );
  }
}
