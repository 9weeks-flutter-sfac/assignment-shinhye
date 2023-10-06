import 'package:flutter/material.dart';

class FrontView extends StatelessWidget {
  const FrontView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 150),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Image.asset(
                  'asset/BusinessCard_images/obverse_logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 20,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.32,
                child: Image.asset(
                  'asset/BusinessCard_images/obverse_jangjeon.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 70,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Image.asset(
                  'asset/BusinessCard_images/obverse_pilo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'asset/BusinessCard_images/obverse_ymsco.png',
                          width: MediaQuery.of(context).size.width / 2.5,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'asset/BusinessCard_images/obverse_barcode.png',
                          width: MediaQuery.of(context).size.width / 5,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '공도윤',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'Cindy / 연구원',
                          style: TextStyle(
                            fontSize: 16,
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
                            color: Colors.indigo,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '010-4157-4252',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'E. ',
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'cindy@ymsco.kr',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'W. ',
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'https://ymsco.kr',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          '서울시 강서구 마곡중앙2로 11\nM밸리 W TOWER III 303-305호',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
