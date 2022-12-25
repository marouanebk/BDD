import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "TEAAACHER",
        style: TextStyle(color: Colors.red, fontSize: 20),
      ),
    );
  }
}
