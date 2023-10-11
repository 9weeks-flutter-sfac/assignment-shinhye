import 'package:assignment/rickandmorty/model/location_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RicksScreen extends StatefulWidget {
  const RicksScreen({super.key});

  @override
  State<RicksScreen> createState() => _RicksScreenState();
}

class _RicksScreenState extends State<RicksScreen> {
  @override
  void initState() {
    super.initState();

    fetchData();
  }

  Future fetchData() async {
    final dio = Dio();
    final resp = await dio.get('https://rickandmortyapi.com/api/location/3');

    final residents = resp.data['residents'];
    print(residents);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Citadel of Ricks'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (_, index) {
          return Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Card(
                child: Column(
                  children: [
                    Image.network(
                        'https://rickandmortyapi.com/api/character/avatar/8.jpeg'),
                    Text('8. Adjudicator Rick'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
