import 'package:assignment/assignment/blog_app_screen.dart';
import 'package:assignment/custom_tablebackend_job/job_screen.dart';
import 'package:assignment/dog_album/dog_album_screen.dart';
import 'package:assignment/rickandmorty/ricks_screen.dart';
import 'package:assignment/serialization_prac/request_screen.dart';
import 'package:assignment/team/team_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(
    MaterialApp(
      // home: RequestScreen(),
      // home: RicksScreen(),
      home: JobScreen(),
      // home: DogAlbumScreen(),
      // home: BlogAppScreen(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
