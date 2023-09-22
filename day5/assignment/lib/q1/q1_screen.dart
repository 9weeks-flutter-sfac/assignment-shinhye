import 'package:assignment/q2/q2_screen.dart';
import 'package:assignment/q3/q3_screen.dart';
import 'package:assignment/q4/q4_screen.dart';
import 'package:flutter/material.dart';

class Q1Screen extends StatelessWidget {
  const Q1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5일차 과제'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Q2Screen(),
                  ),
                );
              },
              child: Text('2번 과제'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Q3Screen(),
                  ),
                );
              },
              child: Text('3번 과제'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Q4Screen(),
                  ),
                );
              },
              child: Text('4번 과제'),
            ),
          ],
        ),
      ),
    );
  }
}
