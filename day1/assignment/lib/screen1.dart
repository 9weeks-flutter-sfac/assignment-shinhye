import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle defaultTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 16.0,
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '안녕하세요!\n간단하게 제 ',
              style: defaultTextStyle,
              children: [
                TextSpan(
                  text: '소개',
                  style: defaultTextStyle.copyWith(
                    color: Colors.blue,
                    fontSize: 32.0,
                  ),
                ),
                TextSpan(
                  text: '를 해보겠습니다\n\n먼저 저의 MBTI는 ',
                  style: defaultTextStyle,
                ),
                TextSpan(
                  text: 'INFJ',
                  style: defaultTextStyle.copyWith(
                    color: Colors.red,
                    fontSize: 32.0,
                  ),
                ),
                TextSpan(
                  text: '이고\n직업은 ',
                  style: defaultTextStyle,
                ),
                TextSpan(
                  text: '개발자',
                  style: defaultTextStyle.copyWith(
                    color: Colors.green,
                    fontSize: 32.0,
                  ),
                ),
                TextSpan(
                  text: '입니다\n\n',
                  style: defaultTextStyle,
                ),
                TextSpan(
                  text: '꿈',
                  style: defaultTextStyle.copyWith(
                    color: Colors.yellow,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: '은 없고요\n그냥 놀고싶습니다\n\n',
                  style: defaultTextStyle.copyWith(
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: '감사합니다',
                  style: defaultTextStyle.copyWith(
                    color: Colors.purple,
                    fontSize: 32.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
