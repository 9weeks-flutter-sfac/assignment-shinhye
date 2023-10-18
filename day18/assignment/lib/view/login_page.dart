import 'package:assignment/view/assignment_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _handleLoginButton() async {
    var res = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: 'test4@gmail.com',
      password: '12341234',
    );
    print(res);
    print(res.user);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AssignmentPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.blueAccent,
              child: Text('ID를 입력했다고 치고'),
            ),
            SizedBox(height: 8),
            Container(
              color: Colors.blueAccent,
              child: Text('PW를 입력했다고 치고'),
            ),
            ElevatedButton(
              onPressed: _handleLoginButton,
              child: Text('로그인'),
            ),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text('로그아웃'),
            ),
            SizedBox(height: 32),
            Text('애플 로그인 실행 불가 ㅠㅠ'),
            SignInWithAppleButton(
              onPressed: () async {
                final credential = await SignInWithApple.getAppleIDCredential(
                  scopes: [
                    AppleIDAuthorizationScopes.email,
                    AppleIDAuthorizationScopes.fullName,
                  ],
                );

                print(credential);

                // Now send the credential (especially `credential.authorizationCode`) to your server to create a session
                // after they have been validated with Apple (see `Integration` section for more information on how to do this)
              },
            ),
          ],
        ),
      ),
    );
  }
}
