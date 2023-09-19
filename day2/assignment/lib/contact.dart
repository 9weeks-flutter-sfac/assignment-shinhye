import 'package:flutter/material.dart';

List<Map<String, String>> contactList = [
  {'name': '이테디', 'phone': '010-1000-2000'},
  {'name': '김스틴', 'phone': '010-9000-8000'},
  {'name': '이주노', 'phone': '010-3000-3000'},
  {'name': '임헬렌', 'phone': '010-2000-8000'},
  {'name': '염해리', 'phone': '010-1000-1000'},
];

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: contactList
              .map(
                (e) => ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/100/100',
                    ),
                  ),
                  title: Text(e['name']!),
                  subtitle: Text(e['phone']!),
                  trailing: Icon(Icons.phone),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
