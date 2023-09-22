import 'package:flutter/material.dart';

String currentText = '';

class Q3Screen extends StatefulWidget {
  const Q3Screen({super.key});

  @override
  State<Q3Screen> createState() => _Q3ScreenState();
}

class _Q3ScreenState extends State<Q3Screen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    currentText = '';
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('5일차 과제 - text mirroring'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){textEditingController.text = '';},
          child: Icon(Icons.close),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textEditingController,
                onChanged: (val) {
                  currentText = textEditingController.text;
                  // print(currentText);
                  setState(() {});
                },
              ),
              Text(currentText),
            ],
          ),
        ),
      ),
    );
  }
}
