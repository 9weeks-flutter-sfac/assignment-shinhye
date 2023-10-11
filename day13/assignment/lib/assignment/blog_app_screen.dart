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
      backgroundColor: Colors.white10,
      body: FutureBuilder(
          future: getPostData(),
          builder: (context, snapshot) {
            // print(snapshot.data);

            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.separated(
                itemCount: snapshot.data!.length + 1,
                itemBuilder: (_, index) {
                  index--;

                  if (index == -1) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Post ${1} ~ ${5}',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }

                  PostModel postItem =
                  PostModel.fromJson(json: snapshot.data![index]);

                  return GestureDetector(
                    onTap: () async {
                      return showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            color: Colors.black,
                            height: 200,
                            padding: EdgeInsets.all(16),
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    postItem.title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    postItem.body,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Text(
                              postItem.id.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  postItem.title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  postItem.body,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  index += 1;

                  if (index % 5 == 0) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Post ${index + 1} ~ ${index + 5}',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(height: 20);
                  }
                },
              ),
            );
          }),
    );
  }
}
