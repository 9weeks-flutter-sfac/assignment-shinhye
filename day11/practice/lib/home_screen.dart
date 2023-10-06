import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('asdf'),
          ElevatedButton(
            onPressed: () {
              List<int> numbers1 = [12, 15, 8, 10, 25, 32, 20, 14];
              // List<int> numbers2 = numbers1.(A)_____((number) => number % 2 == 0).toList();
              List<int> numbers2 = numbers1.where((number) => number % 2 == 0).toList();
              print(numbers2);

              if (numbers2.isNotEmpty) {
                int result = numbers2.reduce((value, element) => value > element ? value : element);

                print('$result');
              } else {
                print('X');
              }
            },
            child: Text('asdf'),
          ),
        ],
      ),
    );
  }
}
