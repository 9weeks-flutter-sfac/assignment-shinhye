import 'package:assignment/team/member_model.dart';
import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  final MemberModel model;

  const MemberCard({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://picsum.photos/${model.id * 100}/${model.id * 100}',
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            model.name,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            '${model.birthYear} / ${model.region} 거주',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black38,
            ),
          ),
          Text(
            '💿 ${model.mbti.name}',
            style: const TextStyle(
              color: Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }
}
