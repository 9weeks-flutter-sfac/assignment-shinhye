import 'package:assignment/contact_upgrade/data/contact_list.dart';
import 'package:flutter/material.dart';

class ContactDetailScreen extends StatelessWidget {
  final int index;

  const ContactDetailScreen({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> e = CONTACT_LIST[index];

    return Scaffold(
      appBar: renderAppBar(e: e),
      body: ListTile(
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
    );
  }

  AppBar renderAppBar({required e,}) {
    return AppBar(
      title: Text(
        '연락처 상세',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ),
      ],
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 200),
        child: Container(),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://picsum.photos/${int.parse(e['id'])}/${int.parse(e['id'])}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
