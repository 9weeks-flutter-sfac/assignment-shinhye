import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            Text('안녕 난 1번 ListView의 자식이다'),
            Text('나도! 1번 ListView의 자식이야'),
            Container(
              height: 50,
              color: Colors.yellow,
              child: ListView(
                  children: [
                    Text('난 2번의 자식임'),
                    Text('나도 2번의 자식임'),
                  ]
              ),
            ),
            Text('난 멀리 떨어져있지만 1번의 자식이야'),
          ]
      ),
    );
  }
}
