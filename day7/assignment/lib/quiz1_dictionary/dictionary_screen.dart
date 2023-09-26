import 'package:assignment/quiz1_dictionary/data.dart';
import 'package:flutter/material.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  controller.page == words.length - 1
                      ? null
                      : controller.nextPage(
                          duration: Duration(milliseconds: 700),
                          curve: Curves.linear,
                        );
                },
                child: Icon(Icons.chevron_right),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  controller.page == 0
                      ? null
                      : controller.previousPage(
                          duration: Duration(milliseconds: 700),
                          curve: Curves.linear,
                        );
                },
                child: Icon(Icons.chevron_left),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: words
              .map(
                (e) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      e['word']!,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1,
                      ),
                    ),
                    Text(
                      e['meaning']!,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -1,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '"${e['example']!}"',
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
