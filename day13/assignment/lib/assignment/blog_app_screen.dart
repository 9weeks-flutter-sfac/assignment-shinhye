import 'package:assignment/assignment/model/post_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BlogAppScreen extends StatefulWidget {
  const BlogAppScreen({super.key});

  @override
  State<BlogAppScreen> createState() => _BlogAppScreenState();
}

class _BlogAppScreenState extends State<BlogAppScreen> {
  @override
  void initState() {
    super.initState();

    getPostData();
  }

  Future<List> getPostData() async {
    final dio = Dio();
    final resp = await dio.get('https://jsonplaceholder.typicode.com/posts');

    return resp.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getPostData(),
          builder: (context, snapshot) {
            // print(snapshot.data);

            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                PostModel postItem =
                    PostModel.fromJson(json: snapshot.data![index]);

                return Container(
                  child: Text(
                    postItem.toString(),
                  ),
                );
              },
              separatorBuilder: (_, index) {
                return SizedBox(height: 10);
              },
            );
          }),
    );
  }
}
