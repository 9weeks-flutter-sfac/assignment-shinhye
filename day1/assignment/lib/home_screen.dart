import 'package:assignment/screen1.dart';
import 'package:assignment/screen2.dart';
import 'package:assignment/screen3.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment 1'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Screen1(),
                  ),
                );
              },
              child: Text('Screen1 - 자기소개'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Screen2(),
                  ),
                );
              },
              child: Text('Screen2 - 노래'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Screen3(),
                  ),
                );
              },
              child: Text('Screen3 - 명암'),
            ),
          ],
        ),
      ),
    );
  }
}
