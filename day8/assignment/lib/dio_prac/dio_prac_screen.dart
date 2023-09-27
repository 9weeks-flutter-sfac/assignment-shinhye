import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioPracScreen extends StatelessWidget {
  DioPracScreen({super.key});

  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            getData();
          },
          child: Text('Dio 요청하기'),
        ),
      ),
    );
  }

  void getData() async {
    final resp = await dio.get(
      'https://www.classum.com/content/30919/vod/84504/viewer',
      options: Options(
        headers: {
          'user-agent': 'Chrome',
          'authorization': 'Bearer asdf',
        },
      ),
    );

    print(resp);
  }
}
