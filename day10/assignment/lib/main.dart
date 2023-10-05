import 'package:assignment/photonecut/photo_screen.dart';
import 'package:assignment/secret_hair/view/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'neo',
        colorScheme: ColorScheme.dark(),
      ),
      home: HomeScreen(),
    ),
  );
}
