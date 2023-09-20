import 'package:assignment/ex2_starbucks/drick_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Map<String, String>> menu_data = [
  {
    'nameKo': '골든 미모사 그린 티',
    'nameEn': 'Golden Mimosa Green Tea',
    'img': 'assets/starbucks/item_drink1.jpeg',
    'price': '6100',
  },
  {
    'nameKo': '블랙 햅쌀 고봉 라떼',
    'nameEn': 'Black Rice Latte',
    'img': 'assets/starbucks/item_drink2.jpeg',
    'price': '6300',
  },
  {
    'nameKo': '아이스 블랙 햅쌀 고봉 라떼',
    'nameEn': 'Iced Black Rice Latte',
    'img': 'assets/starbucks/item_drink3.jpeg',
    'price': '6300',
  },
  {
    'nameKo': '스타벅스 튜메릭 라떼',
    'nameEn': 'Starbucks Turmeric Latte',
    'img': 'assets/starbucks/item_drink4.jpeg',
    'price': '6100',
  },
  {
    'nameKo': '아이스 스타벅스 튜메릭 라떼',
    'nameEn': 'Iced Starbucks Turmeric Latte',
    'img': 'assets/starbucks/item_drink5.jpeg',
    'price': '6100',
  },
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: Icon(CupertinoIcons.left_chevron),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '주문할 매장을 선택해주세요.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                CupertinoIcons.chevron_down,
                color: Colors.white,
                size: 16,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black38,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Pay',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Other',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const Text(
              'NEW',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
            ...menu_data
                .map(
                  (e) => DrinkTile(
                    nameKo: e['nameKo']!,
                    nameEn: e['nameEn']!,
                    img: e['img']!,
                    price: e['price']!,
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
