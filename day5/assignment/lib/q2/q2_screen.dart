import 'package:flutter/material.dart';

List animalList = ['강아지', '고양이', '앵무새', '토끼', '오리', '거위', '원숭이'];

class Q2Screen extends StatefulWidget {
  const Q2Screen({super.key});

  @override
  State<Q2Screen> createState() => _Q2ScreenState();
}

class _Q2ScreenState extends State<Q2Screen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5일차 과제 - scroll to top'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scrollController.jumpTo(0);
        },
        child: Icon(Icons.vertical_align_top),
      ),
      body: ListView.builder(
        controller: scrollController,
        itemCount: animalList.length,
        itemBuilder: (_, index) => Container(
          height: 300,
          child: Center(
            child: Text(
              animalList[index],
            ),
          ),
        ),
      ),
    );
  }
}
