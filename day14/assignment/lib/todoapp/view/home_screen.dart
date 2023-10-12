import 'dart:ui';

import 'package:assignment/todoapp/component/filter_bottom_sheet.dart';
import 'package:assignment/todoapp/component/todo_card.dart';
import 'package:assignment/todoapp/model/todo_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<TodoModel?> getData(todoNumber) async {
    final dio = Dio();
    final resp =
        await dio.get('https://jsonplaceholder.typicode.com/todos/$todoNumber');

    if (resp.statusCode == 200) {
      return TodoModel.fromMap(resp.data);
    }

    return null;
  }

  Future<List<TodoModel>> readData() async {
    final dio = Dio();
    final resp = await dio.get('https://jsonplaceholder.typicode.com/todos');

    // print(resp.data);

    if (resp.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(resp.data);
      return data.map((e) => TodoModel.fromMap(e)).toList();
    }

    return [];
  }

  Future printTodo() async {
    // var todoNumber = 5;
    // var data = await getData(todoNumber);

    var data = await readData();

    print(data);
    return data;
  }

  TodoFilter currentFilter = TodoFilter.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text('Todo App'),
        centerTitle: false,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => FilterBottomSheet(
                  filter: currentFilter,
                  onApply: (filter) {
                    currentFilter = filter;
                    setState(() {});
                  },
                ),
              );
            },
            icon: Icon(Icons.filter_list),
          ),
          IconButton(
            onPressed: () {
              readData();
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: readData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('데이터를 불러오는 중입니다.'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) {
              var item = snapshot.data![index];

              if (currentFilter == TodoFilter.completed) {
                if (item.completed) {
                  return TodoCard(todo: item);
                } else {
                  return Container();
                }
              }
              if (currentFilter == TodoFilter.incompleted) {
                if (!item.completed) {
                  return TodoCard(todo: item);
                } else {
                  return Container();
                }
              }
              return TodoCard(todo: item);
            },
          );
        },
      ),
    );
  }
}
