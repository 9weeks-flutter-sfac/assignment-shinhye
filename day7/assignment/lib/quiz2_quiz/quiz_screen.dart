import 'package:assignment/quiz2_quiz/component/quiz_card.dart';
import 'package:assignment/quiz2_quiz/quiz_data.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late PageController controller;

  @override
  void initState() {
    super.initState();

    controller = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    const bgDeco = BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.pinkAccent,
          Colors.blue,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: answerList.length > 5
            ? null
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  answerList.length,
                  (index) => answerList[index] == true
                      ? Icon(Icons.circle_outlined)
                      : Icon(Icons.close),
                ),
              ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            controller.previousPage(
              duration: Duration(milliseconds: 500),
              curve: Curves.linear,
            );
          },
          icon: Icon(
            Icons.navigate_before,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.linear,
              );
            },
            icon: Icon(
              Icons.navigate_next,
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: bgDeco,
        child: Align(
          alignment: Alignment.centerLeft,
          child: PageView.builder(
            controller: controller,
            itemCount: quizzes.length,
            physics: const PageScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => Builder(
              builder: (context) {
                return QuizCard(
                  index: index,
                  controller: controller,
                  onPressed: () async {
                    controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );

                    setState(() {});
                  },
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: answerList.length == quizzes.length
          ? FloatingActionButton(
              onPressed: () {
                answerList.clear();
                controller.animateToPage(
                  0,
                  duration: Duration(seconds: 1),
                  curve: Curves.linear,
                );
                setState(() {});
              },
              child: Icon(Icons.refresh),
            )
          : null,
    );
  }
}
