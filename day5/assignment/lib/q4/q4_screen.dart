import 'package:assignment/q4/weather_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Q4Screen extends StatefulWidget {
  const Q4Screen({super.key});

  @override
  State<Q4Screen> createState() => _Q4ScreenState();
}

class _Q4ScreenState extends State<Q4Screen> {
  bool isSun = false;
  bool isMoon = false;
  bool isStar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5일차 과제 - on/off'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isSun = false;
          isMoon = false;
          isStar = false;
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Column(
              children: [
                WeatherItem(
                  icon: Icons.sunny,
                  isOn: isSun,
                  onItemPressed: () {
                    isSun = !isSun;
                    setState(() {});
                  },
                  activatedColor: Colors.red,
                  title: 'Sun',
                ),
                WeatherItem(
                  icon: CupertinoIcons.moon_fill,
                  isOn: isMoon,
                  onItemPressed: () {
                    isMoon = !isMoon;
                    setState(() {});
                  },
                  activatedColor: Colors.yellow,
                  title: 'Moon',
                ),
                WeatherItem(
                  icon: Icons.star,
                  isOn: isStar,
                  onItemPressed: () {
                    isStar = !isStar;
                    setState(() {});
                  },
                  activatedColor: Colors.yellow,
                  title: 'Star',
                ),
              ],
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: '켜거나 끄고 싶은 아이콘 이름을 입력하세요. (Sun, Moon, Star)',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (val){
              if (val == 'Sun') {
                isSun = !isSun;
              } else if (val == 'Moon') {
                isMoon = !isMoon;
              } else if (val == 'Star') {
                isStar = !isStar;
              }
              setState(() {

              });
            },
          ),
        ],
      ),
    );
  }
}
