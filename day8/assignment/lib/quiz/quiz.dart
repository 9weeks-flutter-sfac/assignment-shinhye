import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  Future getData(int num) async {
    final dio = Dio();
    int number = num;
    final url = 'https://sniperfactory.com/sfac/http_assignment_$number';

    final resp = await dio.post(
      url,
      options: Options(
        headers: {
          'user-agent': 'SniperFactoryBrowser',
          'authorization': 'Bearer temp',
        },
      ),
    );

    return resp.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: List.generate(51, (index) {
              int num = index + 100;
              return FutureBuilder(
                future: getData(num),
                builder: (context, snapshot) {
                  final ans = snapshot.data;
                  return Text('query: $num, res: $ans');
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
