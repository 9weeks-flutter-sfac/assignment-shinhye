import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ReqScreen extends StatelessWidget {
  const ReqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    Future<List> getResponse() async {
      Response response;
      response = await dio
          .get('https://jsonplaceholder.typicode.com/photos?albumId=1');

      return response.data;
    }

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getResponse(),
          builder: (context, snapshot) {
            // print(snapshot.data);

            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            // return Container(
            //   child: Text(
            //     snapshot.data.toString(),
            //   ),
            // );

            return ListView.builder(
              itemBuilder: (_, index) {
                var item = snapshot.data![index];
                // print('$item, ${item.runtimeType}');
                print(item.runtimeType);

                return Card(
                  child: Column(
                    children: [
                      Image.network(item['url']),
                      Text(
                        item['title']
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
