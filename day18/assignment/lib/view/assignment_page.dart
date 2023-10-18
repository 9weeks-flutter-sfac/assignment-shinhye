import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/post.dart';

class AssignmentPage extends StatefulWidget {
  const AssignmentPage({super.key});

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  var ref = FirebaseFirestore.instance.collection('post').withConverter(
        fromFirestore: (snapshot, _) => Post.fromMap(snapshot.data()!),
        toFirestore: (data, _) => data.toMap(),
      );

  Future<List<QueryDocumentSnapshot<Post>>> readData() async {
    var items = await ref.get();
    return items.docs;
  }

  likesUp(String id) {
    var likes = ref.doc(id).update(
      {
        'likes': FieldValue.increment(1),
      },
    );
    return likes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<QueryDocumentSnapshot<Post>>>(
                future: readData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(snapshot.data![index].data().title),
                        subtitle: Text(
                            '${snapshot.data![index].data().content} likes: ${snapshot.data![index].data().likes}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.favorite),
                          onPressed: () {
                            likesUp(snapshot.data![index].id);
                            setState(() {});
                          },
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
            Container(
              height: 100,
              color: Colors.blue.withOpacity(0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('유저정보'),
                  Text('email: ${FirebaseAuth.instance.currentUser?.email}'),
                  FirebaseAuth.instance.currentUser?.emailVerified != true
                      ? Text(
                          '이 곳을 눌러 이메일 인증을 해주세요',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )
                      : Text(
                          '이메일이 인증된 사용자입니다',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                  // Text(
                  //     'emailVerified: ${FirebaseAuth.instance.currentUser?.emailVerified}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
