import 'dart:convert';
import 'package:assignment/serialization_prac/model/model_77.dart';
import 'package:assignment/serialization_prac/model/model_78.dart';
import 'package:assignment/serialization_prac/model/model_79.dart';
import 'package:assignment/serialization_prac/model/random_data_api_model2.dart';
import 'package:assignment/serialization_prac/model/random_nation_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  final dio = Dio();

  @override
  void initState() {
    super.initState();

    // get78();
  }

  Future get76() async {
    String url = 'https://meowfacts.herokuapp.com/';
    final resp = await dio.get(url);

    return resp.data['data'];
  }

  Future get77() async {
    String url = 'https://catfact.ninja/fact';
    final resp = await dio.get(url);

    return Model77.fromJson(json: resp.data);
  }

  Future get78() async {
    String url = 'https://api.adviceslip.com/advice';
    final resp = await dio.get(url);

    final decodedResp = jsonDecode(resp.data);

    return Model78.fromJson(json: decodedResp['slip']);
  }

  Future get79() async {
    String url = 'https://www.boredapi.com/api/activity';
    final resp = await dio.get(url);

    return Model79.fromJson(json: resp.data);
  }

  Future getRandomData() async {
    String url = 'https://random-data-api.com/api/v2/addresses';
    final resp = await dio.get(url);

    return RandomDataModel.fromJson(json: resp.data);
  }

  Future getRandomNation() async {
    String url = 'https://random-data-api.com/api/nation/random_nation';
    final resp = await dio.get(url);

    return RandomNationModel.fromJson(json: resp.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text('76. '),
                  ),
                  Expanded(
                    flex: 4,
                    child: FutureReturn(
                      futureFunc: get76(),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Text('77. '),
                  ),
                  Expanded(
                    flex: 4,
                    child: FutureReturn(
                      futureFunc: get77(),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Text('78. '),
                  ),
                  Expanded(
                    flex: 4,
                    child: FutureReturn(
                      futureFunc: get78(),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Text('79. '),
                  ),
                  Expanded(
                    flex: 4,
                    child: FutureReturn(
                      futureFunc: get79(),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Text('Random. '),
                  ),
                  Expanded(
                    flex: 4,
                    child: FutureReturn(
                      futureFunc: getRandomData(),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Text('Random nation. '),
                  ),
                  Expanded(
                    flex: 4,
                    child: FutureReturn(
                      futureFunc: getRandomNation(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FutureReturn extends StatelessWidget {
  final Future futureFunc;

  const FutureReturn({
    required this.futureFunc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureFunc,
      builder: (context, snapshot) {
        // print(snapshot.data);

        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Container(
          child: Text('${snapshot.data}'),
        );
      },
    );
  }
}
