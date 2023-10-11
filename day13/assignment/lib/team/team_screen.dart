import 'package:assignment/team/member_card_component.dart';
import 'package:assignment/team/member_model.dart';
import 'package:assignment/team/members_data.dart';
import 'package:flutter/material.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
        title: const Text('231011 5팀 구성원'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            itemCount: members.length,
            itemBuilder: (_, index) {
              MemberModel item = members[index];
              return MemberCard(model: item);
            },
            separatorBuilder: (_, index) {
              return const SizedBox(height: 10);
            },
          ),
        ),
      ),
    );
  }
}
