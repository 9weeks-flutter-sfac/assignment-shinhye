import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:assignment/secret_hair/view/default_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';
import 'package:secret_cat_sdk/model/secret.dart';

class SecretPage extends StatelessWidget {
  const SecretPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          children: [
            Icon(CupertinoIcons.eye),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('비밀보러왔어요'),
            ),
          ],
        ),
        centerTitle: false,
      ),
      child: SafeArea(
        child: FutureBuilder(
          future: SecretCatApi.fetchSecrets(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                Secret item = snapshot.data![index];

                Color randomColor = Colors
                    .primaries[Random().nextInt(Colors.primaries.length)]
                    .withOpacity(0.5);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('이거 비밀인데...'),
                    FadeIn(
                      duration:
                          Duration(milliseconds: 300 * Random().nextInt(10)),
                      child: Card(
                        color: randomColor,
                        margin: const EdgeInsets.only(
                          top: 12,
                          bottom: 30,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            color: Colors.white.withOpacity(0.8),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  item.secret.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  item.createdAt.toString(),
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
