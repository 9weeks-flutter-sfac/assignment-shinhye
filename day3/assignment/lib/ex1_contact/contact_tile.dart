import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  final String name;
  final String number;
  final String imgUrl;

  const ContactTile({
    required this.name,
    required this.number,
    required this.imgUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(number),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imgUrl),
      ),
      trailing: Icon(Icons.call),
    );
  }
}
