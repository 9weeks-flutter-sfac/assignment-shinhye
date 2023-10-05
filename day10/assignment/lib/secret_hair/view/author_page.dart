import 'dart:math';
import 'package:assignment/secret_hair/view/default_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';
import 'package:secret_cat_sdk/model/author.dart';
import 'package:secret_cat_sdk/model/secret.dart';

class AuthorPage extends StatelessWidget {
  const AuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          children: [
            Icon(CupertinoIcons.mic),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('아-아- 비밀 말한 사람'),
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

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    '용자는 바로 이 사람들일세...',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Wrap(
                    spacing: 5,
                    children: List.generate(
                      snapshot.data!.length,
                      (index) {
                        Color randomColor = Colors.primaries[
                                Random().nextInt(Colors.primaries.length)]
                            .withOpacity(0.5);

                        Secret item = snapshot.data![index];

                        if (item.author == null) {
                          return Container(
                            width: 0,
                          );
                        }

                        return Chip(
                          backgroundColor: randomColor,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item.author!.username.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
