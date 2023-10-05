import 'dart:math';
import 'package:assignment/secret_hair/view/default_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';
import 'package:secret_cat_sdk/model/secret.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String content = '';

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Colors.white,
        width: 4,
      ),
    );

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: DefaultLayout(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Row(
            children: [
              Icon(CupertinoIcons.ear),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('비밀얘기하러왔어요'),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '하.. 이거 말해도 될지 모르겠는데요...',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.symmetric(vertical: 32),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      maxLines: 10,
                      maxLength: 500,
                      onChanged: (val) {
                        content = val;
                        print(content);
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        border: defaultBorder,
                        focusedBorder: defaultBorder,
                        enabledBorder: defaultBorder.copyWith(
                          borderSide: defaultBorder.borderSide.copyWith(
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        hintText: '말해라 (500자까지만)',
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      foregroundColor: Colors.black,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () async {
                      final submitted = await SecretCatApi.addSecret(content);

                      SecretCatApi.addSecret(
                        content,

                      );
                      print(submitted);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text('잘했다! 👍'),
                        ),
                      );

                      Navigator.of(context).pop();
                    },
                    child: Text('다 말했습니다.'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
