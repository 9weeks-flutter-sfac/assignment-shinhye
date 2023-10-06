import 'package:flutter/material.dart';

class BackView extends StatelessWidget {
  const BackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Image.asset(
                'asset/BusinessCard_images/reverse__barcode.png',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              'asset/BusinessCard_images/reverse_insideout.png',
              width: MediaQuery.of(context).size.width / 3,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '공도윤',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'M.',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '010-4157-4252',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'E. ',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'cindy@ymsco.kr',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'W. ',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'https://ymsco.kr',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          '서울시 강서구 마곡중앙2로 11\nM밸리 W TOWER III 303-305호',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'asset/BusinessCard_images/reverse_sniperfactory.png',
                      width: MediaQuery.of(context).size.width / 6,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 32),

                    Image.asset(
                      'asset/BusinessCard_images/reverse__VKJ.png',
                      width: MediaQuery.of(context).size.width / 6,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
