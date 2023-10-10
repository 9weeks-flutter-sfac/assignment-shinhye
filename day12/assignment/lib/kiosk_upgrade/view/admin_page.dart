import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('메뉴 추가'),
          ),
          ListTile(
            title: Text('메뉴 삭제'),
          ),
          ListTile(
            title: Text('메뉴 수정'),
          ),
        ],
      ),
    );
  }
}
