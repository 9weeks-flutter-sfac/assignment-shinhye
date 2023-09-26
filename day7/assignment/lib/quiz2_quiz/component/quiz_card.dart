import 'package:assignment/quiz2_quiz/quiz_data.dart';
import 'package:flutter/material.dart';

List<bool> answerList = [];

class QuizCard extends StatelessWidget {
  final int index;
  final PageController controller;
  final VoidCallback onPressed;

  const QuizCard({
    required this.index,
    required this.controller,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // print(answerList);

    return Container(
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
        vertical: MediaQuery.of(context).size.height * 0.2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quizzes[index]['question'].toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 32),
            ...quizzes[index]['options']
                .map(
                  (e) => ElevatedButton(
                    onPressed: () {
                      bool ans = quizzes[index]['options']
                              [quizzes[index]['answer'] - 1] ==
                          e;
                      answerList.add(ans);

                      onPressed();
                    },
                    child: Text(e),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
