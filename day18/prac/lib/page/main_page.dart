import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List items = [];
  var instance = FirebaseFirestore.instance;

  readFromCloudFireStore() async {
    var res = await instance.collection('memo').get();
    items = res.docs.map((e) => e.data()).toList();
    setState(() {});
  }

  getDocument(String documentId) async {
    var res =
        await instance.collection('memo').doc('6XX6cEr7GaC3AAwZs2yn').get();
    print(res.data());
  }

  readFinishedDocument() async {
    var res = await instance
        .collection('memo')
        .where('isFinished', isEqualTo: true)
        .get();
    print(res.docs);
    print(res.size);
  }

  createDocument(String title) async {
    var res = await instance
        .collection('memo')
        .add({'title': title, 'isFinished': false});
    print(res.get());
  }

  createDocumentById(String docId, String title) async {
    var res = await instance.collection('memo').doc(docId).set(
      {
        'title': title,
        'isFinished': false,
      },
      SetOptions(
        merge: true,
      ),
    );
  }

  updateDocumentById(String docId, Map<String, dynamic> data) {
    instance.collection('memo').doc(docId).update(data);
  }

  deleteDocumentById(String docId) async {
    await instance.collection('memo').doc(docId).delete();
  }

  _handleLoginButton() async {
    var res = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: 'test4@gmail.com',
      password: '12341234',
    );
    print(res);
    print(res.user);
  }

  _handleSignupButton() {
    print('signup btn clicked');
    print(FirebaseAuth.instance.currentUser);
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: 'test2@gmail.com',
      password: '12341234',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: readFromCloudFireStore,
              child: Text('데이터 가져오기'),
            ),
            TextButton(
              onPressed: () {
                getDocument('6XX6cEr7GaC3AAwZs2yn');
                getDocument('sbffJmeOpnudaV0gbEHW');
              },
              child: Text('하나만 가져오기'),
            ),
            TextButton(
              onPressed: readFinishedDocument,
              child: Text('finished 만 가져오기'),
            ),
            TextButton(
              onPressed: () {
                createDocument('책방 가기');
              },
              child: Text('문서 추가'),
            ),
            TextButton(
              onPressed: () {
                createDocumentById('123456789', '노래부르기4');
              },
              child: Text('문서 추가 by Id'),
            ),
            TextButton(
              onPressed: () {
                updateDocumentById('123456789', {
                  'isFinished': true,
                });
              },
              child: Text('Update'),
            ),
            TextButton(
              onPressed: () {
                deleteDocumentById('nHZmm6bA6Jak7mbgCPUK');
              },
              child: Text('deleteDocumentById'),
            ),
            if (items.isNotEmpty)
              ...items.map((e) => Text(e['title'])).toList(),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('ID를 입력하세요'),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('비밀번호를 입력하세요'),
              ),
            ),
            ElevatedButton(
              onPressed: _handleLoginButton,
              child: Text('로그인'),
            ),
            ElevatedButton(
              onPressed: signInWithGoogle,
              child: Text('Google 로그인'),
            ),
            TextButton(
              onPressed: _handleSignupButton,
              child: Text('회원가입'),
            ),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text('로그아웃'),
            ),
            TextButton(
              onPressed: () async {
                var picker = ImagePicker();
                var image = await picker.pickImage(source: ImageSource.gallery);

                var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: 'test2@gmail.com',
                  password: '12341234',
                ).then((value) => value.user);

                if (image != null) {
                  print(image);
                  
                  var ref = FirebaseStorage.instance.ref('profile/${user!.uid}');
                  await ref.putFile(File(image.path));

                  var downloadUrl = await ref.getDownloadURL();
                  print(downloadUrl);

                  user.updatePhotoURL(downloadUrl);

                }
                
              },
              child: Text('이미지 업로드'),
            ),
          ],
        ),
      ),
    );
  }
}

uploadImage(XFile file) {
  var ref = FirebaseStorage.instance.ref();

  ref.putFile(File(file.path)).then((p0) => fetchImage());

}

fetchImage() async {
  var ref = FirebaseStorage.instance.ref('/images');
  var res = await ref.listAll();
  print(res);
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
