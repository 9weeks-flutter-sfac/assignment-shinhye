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
  @override
  void initState() {
    super.initState();

    readData();
  }

  List<TodoModel> todos = [];

  Future readData() async {
    final dio = Dio();
    final resp = await dio.get('https://jsonplaceholder.typicode.com/todos');

    if (resp.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(resp.data);
      todos = data.map((e) => TodoModel.fromMap(e)).toList();
      setState(() {});
    }
  }

  TodoFilter currentFilter = TodoFilter.all;

  List<TodoModel> filterMaker(List<TodoModel> values) {
    switch (currentFilter) {
      case TodoFilter.all:
        return values;
      case TodoFilter.completed:
        return values.where((element) => element.completed == true).toList();
      case TodoFilter.incompleted:
        return values.where((element) => element.completed != true).toList();
    }
  }

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
              currentFilter = TodoFilter.all;
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: ListView.builder(
        itemCount: filterMaker(todos).length,
        itemBuilder: (_, index) {
          return TodoCard(todo: filterMaker(todos)[index]);
        },
      ),
    );
  }
}
