import 'dart:math';

import 'package:assignment/assignment1/data.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ForceRefetchingScreen extends StatefulWidget {
  const ForceRefetchingScreen({super.key});

  @override
  State<ForceRefetchingScreen> createState() => _ForceRefetchingScreenState();
}

class _ForceRefetchingScreenState extends State<ForceRefetchingScreen> {
  int i = Random().nextInt(imageUrl.length);

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));

    int j = Random().nextInt(imageUrl.length);

    // 이전과 다른 이미지로 변경한다.
    while (i == j) {
      j = Random().nextInt(imageUrl.length);
    }

    i = j;
    setState(() {});

    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('7일차 과제 1번'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SmartRefresher(
          enablePullDown: true,
          header: WaterDropHeader(),
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(imageUrl[i]),
            ),
          ),
        ),
      ),
    );
  }
}
