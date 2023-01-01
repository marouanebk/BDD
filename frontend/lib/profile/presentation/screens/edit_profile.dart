import 'package:flutter/material.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/profile/presentation/component/biography_page.dart';

class EditProfileScreen extends StatelessWidget {
  final numberE;
  const EditProfileScreen({required this.numberE, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 77, left: 20, right: 20),
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
                  "Profile",
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
              height: 28,
            ),
            profileItemCard(
              context,
              Icons.lock,
              "Update Password",
              const BioGraphyPage(),
            ),
            const SizedBox(
              height: 10,
            ),
            profileItemCard(
              context,
              Icons.mark_email_read,
              "Confirm My email",
              const BioGraphyPage(),
            ),
            const SizedBox(
              height: 10,
            ),
            profileItemCard(
              context,
              Icons.attach_email_outlined,
              "Change my email",
              const BioGraphyPage(),
            ),
            const SizedBox(
              height: 10,
            ),
            if (numberE ==2)
            profileItemCard(
              context,
              Icons.list,
              "Change biography",
              const BioGraphyPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileItemCard(context, icon, text, link) {
    return GestureDetector(
      onTap: () => Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(
          builder: (_) => link,
        ),
      ),
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
        child: Padding(
          padding: const EdgeInsets.only(right: 24.0, left: 24),
          child: Row(
            children: [
              Icon(
                icon,
                color: Color(AppColors.blue),
              ),
              const SizedBox(
                width: 28,
              ),
              Text(
                text,
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w500,
                  color: Color(AppColors.writting),
                  fontSize: 16,
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
        ),
      ),
    );
  }
}
