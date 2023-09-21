import 'package:assignment/assginment2/menu_item_card.dart';
import 'package:flutter/material.dart';

List<String?> selectedFoodList = [];

const FoodList = [
  {'title': '떡볶이', 'img': 'assets/option_bokki.png'},
  {'title': '맥주', 'img': 'assets/option_beer.png'},
  {'title': '김밥', 'img': 'assets/option_kimbap.png'},
  {'title': '오므라이스', 'img': 'assets/option_omurice.png'},
  {'title': '돈까스', 'img': 'assets/option_pork_cutlets.png'},
  {'title': '라면', 'img': 'assets/option_ramen.png'},
  {'title': '우동', 'img': 'assets/option_udon.png'},
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: renderFloatingActionButton(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '주문 리스트',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(selectedFoodList.toString()),
            const SizedBox(height: 16),
            const Text(
              '음식',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: GridView.builder(
                itemCount: FoodList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      selectedFoodList.add(FoodList[index]['title']);
                      setState(() {});
                    },
                    child: MenuItemCard(
                      title: FoodList[index]['title']!,
                      img: FoodList[index]['img']!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar renderAppBar() {
    return AppBar(
      title: const Text(
        '분식왕 이테디 주문하기',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
    );
  }

  ElevatedButton renderFloatingActionButton() {
    return ElevatedButton(
      onPressed: () {
        selectedFoodList.clear();
        setState(() {

        });
      },
      style: ButtonStyle(
        elevation: MaterialStatePropertyAll(1),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 12,
        ),
        child: Text(
          '초기화하기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
