import 'package:flutter/material.dart';
import 'package:practice/business_card/card_screen.dart';
import 'package:practice/find_the/the_screen.dart';
import 'package:practice/home_screen.dart';
import 'package:practice/music_ui/music_screen.dart';
import 'package:practice/pubdev/pubdev_screen.dart';
import 'package:practice/request/req_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TheScreen(),
    ),
  );
}
