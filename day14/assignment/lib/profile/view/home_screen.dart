import 'package:animate_do/animate_do.dart';
import 'package:assignment/profile/model/user_model.dart';
import 'package:assignment/profile/view/profile_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

List<User> users = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    readUsers();
  }

  Future getUser() async {
    final dio = Dio();
    const url = 'https://jsonplaceholder.typicode.com/users/1';

    final resp = await dio.get(url);

    if (resp.statusCode == 200) {
      var user1 = User.fromMap(resp.data);
      print(user1.address.city);
    }
  }

  Future readUsers() async {
    final dio = Dio();
    const url = 'https://jsonplaceholder.typicode.com/users';

    final resp = await dio.get(url);

    if (resp.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(resp.data);
      var requestedUsers = data.map((e) => User.fromMap(e)).toList();

      users = requestedUsers;
      setState(() {});
    }
    // print(users);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('My Contacts'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (_, index) {
            return FadeInRight(
              from: index * 50.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ProfileScreen(
                        index: index,
                      ),
                    ),
                  );
                },
                child: ListTile(
                  leading: CircleAvatar(
                    child: ClipOval(
                      child: Image.network(
                          'https://xsgames.co/randomusers/assets/avatars/male/${users[index].id}.jpg'),
                    ),
                  ),
                  title: Text(users[index].name),
                  subtitle: Text(users[index].email),
                  trailing: Icon(
                    Icons.chevron_right,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
