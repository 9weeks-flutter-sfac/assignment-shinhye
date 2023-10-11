import 'package:assignment/custom_tablebackend_job/model/job_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  Future fetchData() async {
    final dio = Dio();

    final resp =
        await dio.get('https://api.tablebackend.com/v1/rows/e44iBzYnGJpf');

    return resp.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                final jobItem = JobModel.fromJson(
                  json: snapshot.data![index],
                );

                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (jobItem.category != null)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${jobItem.jobs}',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    '${jobItem.category}',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          if (jobItem.category == null)
                            Text(
                              '${jobItem.jobs}',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          const SizedBox(height: 10),
                          if (jobItem.work != null)
                            Text('직업 설명: ${jobItem.work}'),
                          if (jobItem.major != null)
                            Text('관련 전공: ${jobItem.major}'),
                          if (jobItem.cert != null)
                            Text('관련 자격증: ${jobItem.cert}'),
                          if (jobItem.skill != null)
                            Text('필요 스킬: ${jobItem.skill}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, index) {
                return SizedBox(height: 20);
              },
            );
          }),
    );
  }
}
