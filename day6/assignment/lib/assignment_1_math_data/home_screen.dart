import 'package:assignment/assignment_1_math_data/page1.dart';
import 'package:assignment/assignment_1_math_data/page2.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Page1(),
        Page2(),
      ],
    );
  }
}
