import 'package:assignment/contact_upgrade/data/contact_list.dart';
import 'package:assignment/contact_upgrade/screen/detail_view/contact_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class MainContactView extends StatelessWidget {
  const MainContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: CONTACT_LIST
          .mapIndexed(
            (index, e) => ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ContactDetailScreen(
                  index: index,
                ),
              ),
            );
          },
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://picsum.photos/${int.parse(e['id'])}/${int.parse(e['id'])}',
            ),
          ),
          title: Text(e['name']!),
          subtitle: Text(e['phone']!),
          trailing: Icon(Icons.phone),
        ),
      )
          .toList(),
    );
  }
}
