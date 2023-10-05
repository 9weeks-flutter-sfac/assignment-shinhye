import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:assignment/secret_hair/view/author_page.dart';
import 'package:assignment/secret_hair/view/default_layout.dart';
import 'package:assignment/secret_hair/view/secret_page.dart';
import 'package:assignment/secret_hair/view/upload_page.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        children: [
          const _HairPart(),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
            ),
            child: const Column(
              children: [
                _EyePart(),
                Divider(color: Colors.black, height: 0),
                _EarPart(),
                Divider(color: Colors.black, height: 0),
                _LipPart(),
              ],
            ),
          ),
          Expanded(
            child: FadeInUp(
              child: Center(
                child: Text('이거 비밀인데...\n비밀을 들으면 머리가 자라나요'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HairPart extends StatelessWidget {
  const _HairPart({super.key});

  @override
  Widget build(BuildContext context) {
    double adjustedK = MediaQuery.of(context).size.width * 290 / 428;

    return Expanded(
      child: FutureBuilder(
          future: SecretCatApi.fetchSecrets(),
          builder: (context, snapshot) {
            print(snapshot.data);

            int length = 0;

            if (snapshot.connectionState == ConnectionState.done) {
              length = snapshot.data!.length;
            }

            return Stack(
              children: List.generate(
                length,
                (index) => Positioned(
                  bottom: 0,
                  left: Random().nextDouble() * adjustedK,
                  child: FadeInDown(
                    from: 10,
                    duration: Duration(seconds: 5),
                    child: Container(
                      width: 5,
                      height: 40 + Random().nextInt(10) - 5,
                      padding: EdgeInsets.symmetric(horizontal: 1),
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class _EyePart extends StatelessWidget {
  const _EyePart({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => SecretPage(),
          ),
        );
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerRight,
                widthFactor: 1 / 2,
                child: Image.asset(
                  'asset/image/eye.png',
                  height: MediaQuery.of(context).size.height / 10,
                ),
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    '비밀 보러 가기',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EarPart extends StatelessWidget {
  const _EarPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => UploadPage(),
          ),
        );
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        child: Align(
          alignment: Alignment.centerRight,
          child: Row(
            children: [
              const Expanded(
                child: Center(
                  child: Text(
                    '비밀 말하러 가기',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                widthFactor: 1 / 2,
                child: Image.asset(
                  'asset/image/ear.png',
                  height: MediaQuery.of(context).size.height / 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LipPart extends StatelessWidget {
  const _LipPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => AuthorPage(),
          ),
        );
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerRight,
                widthFactor: 1 / 2,
                child: Image.asset(
                  'asset/image/lips.png',
                  height: MediaQuery.of(context).size.height / 10,
                ),
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    '누가누가말했나',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
