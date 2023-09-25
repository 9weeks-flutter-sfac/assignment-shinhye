import 'package:assignment/contact_upgrade/data/contact_list.dart';
import 'package:assignment/contact_upgrade/data/history_list.dart';
import 'package:assignment/contact_upgrade/screen/detail_view/contact_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class MainHistoryView extends StatelessWidget {
  const MainHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: HISTORY_LIST
          .mapIndexed(
            (index, e) => ListTile(
              onTap: () {},
              title: Text(e['name']!),
              trailing: Icon(
                  e['status'] == 'call' ? Icons.call_made : Icons.call_missed),
            ),
          )
          .toList(),
    );
  }
}
