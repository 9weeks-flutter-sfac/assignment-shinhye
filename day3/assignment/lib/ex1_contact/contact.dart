import 'package:assignment/ex1_contact/contact_tile.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 연락처'),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_phone),
          label: '연락처',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: '통화기록',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '설정',
        ),
      ]),
      body: ListView(
        children: [
          ContactTile(
            name: '이테디',
            number: '010-1000-2000',
            imgUrl: 'https://picsum.photos/100/100',
          ),
          ContactTile(
            name: '밀리',
            number: '010-1000-2000',
            imgUrl: 'https://picsum.photos/101/101',
          ),
          ContactTile(
            name: '크리스',
            number: '010-1000-2000',
            imgUrl: 'https://picsum.photos/102/102',
          ),
          ContactTile(
            name: '주소',
            number: '010-1000-2000',
            imgUrl: 'https://picsum.photos/103/103',
          ),
          ContactTile(
            name: '해리',
            number: '010-1000-2000',
            imgUrl: 'https://picsum.photos/104/104',
          ),
          ContactTile(
            name: '벨라',
            number: '010-1000-2000',
            imgUrl: 'https://picsum.photos/105/105',
          ),
          ContactTile(
            name: '헬렌',
            number: '010-1000-2000',
            imgUrl: 'https://picsum.photos/106/106',
          ),
        ],
      ),
    );
  }
}
