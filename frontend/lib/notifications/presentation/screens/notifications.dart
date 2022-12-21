import 'package:flutter/material.dart';
import 'package:frontend/cores/const/const.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 70),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Notifications",
                  style: TextStyle(
                    wordSpacing: 0.5,
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F1828),
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              notificationList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget notificationList() {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => const SizedBox(
        height: 14,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return notificationCard();
      },
    );
  }

  Widget notificationCard() {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          color: const Color(0xFFD9D9D9),
        ),
      ),
      child: Row(
        children: const [],
      ),
    );
  }
}
