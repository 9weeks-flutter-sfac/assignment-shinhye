import 'package:assignment/assignment/course_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CourseHomeScreen extends StatefulWidget {
  const CourseHomeScreen({super.key});

  @override
  State<CourseHomeScreen> createState() => _CourseHomeScreenState();
}

class _CourseHomeScreenState extends State<CourseHomeScreen> {
  @override
  void initState() {
    super.initState();

    getCourseInformation();
  }

  Future<CourseModel> getCourseInformation() async {
    final dio = Dio();
    final resp = await dio.get('https://sniperfactory.com/sfac/http_json_data');
    final pResp = CourseModel.fromJson(json: resp.data['item']);

    return pResp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<CourseModel>(
        future: getCourseInformation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Card(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            child: Image.network(
                              snapshot.data!.image,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width * 0.6,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  snapshot.data!.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Divider(),
                                Text(snapshot.data!.description),
                                const SizedBox(height: 4),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    '${snapshot.data!.price}원 결제하고 등록',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
