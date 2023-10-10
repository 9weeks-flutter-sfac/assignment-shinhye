import 'package:assignment/kiosk_upgrade/model/menu_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../component/menu_item_card.dart';
import 'admin_page.dart';
import '../component/custom_chip.dart';

class KioskScreen extends StatefulWidget {
  const KioskScreen({super.key});

  @override
  State<KioskScreen> createState() => _KioskScreenState();
}

class _KioskScreenState extends State<KioskScreen> {
  SharedPreferences? prefs;
  List<String> selectedFoodList = [];

  @override
  void initState() {
    super.initState();

    initPreferences();

    getMenuItems();
  }

  void initPreferences() async {
    prefs = await SharedPreferences.getInstance();

    if (prefs != null) {
      selectedFoodList = prefs!.getStringList('selectedFoodList') ?? [];
      setState(() {});
    }
  }

  Future<List> getMenuItems() async {
    final dio = Dio();

    final resp = await dio
        .get('http://52.79.115.43:8090/api/collections/options/records');

    // print(resp.data['items']);

    return resp.data['items'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          selectedFoodList.isNotEmpty ? renderPaymentButton() : null,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FutureBuilder<List>(
            future: getMenuItems(),
            builder: (context, snapshot) {
              // print(snapshot.data);

              if (snapshot.connectionState != ConnectionState.done) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '주문 리스트',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (selectedFoodList.isNotEmpty)
                    CustomChips(
                      selectedFoodList: selectedFoodList.isNotEmpty
                          ? selectedFoodList as List<String>
                          : [],
                      onDeleted: () {
                        setState(() {});

                        prefs!.setStringList(
                          'selectedFoodList',
                          selectedFoodList.isNotEmpty
                              ? selectedFoodList as List<String>
                              : [],
                        );
                      },
                    )
                  else
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text('주문한 메뉴가 없습니다'),
                      ),
                    ),
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
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (_, index) {
                        final menuItem = snapshot.data![index];
                        final pMenuItem = MenuModel.fromJson(json: menuItem);

                        return GestureDetector(
                          onTap: () {
                            selectedFoodList.add(pMenuItem.menu);
                            setState(() {});

                            prefs!.setStringList(
                              'selectedFoodList',
                              (selectedFoodList as List<String>),
                            );
                          },
                          child: MenuItemCard(
                            title: pMenuItem.menu,
                            img: pMenuItem.imageUrl,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  AppBar renderAppBar() {
    return AppBar(
      title: GestureDetector(
        onDoubleTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AdminPage(),
            ),
          );
        },
        child: const Text(
          '분식왕 이테디 주문하기',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
    );
  }

  ElevatedButton renderPaymentButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {});
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
          '결제하기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

// ElevatedButton renderClearButton() {
//   return ElevatedButton(
//     onPressed: () {
//       selectedFoodList.clear();
//       setState(() {});
//     },
//     style: ButtonStyle(
//       elevation: MaterialStatePropertyAll(1),
//       shape: MaterialStatePropertyAll(
//         RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(100),
//         ),
//       ),
//     ),
//     child: const Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: 8,
//         vertical: 12,
//       ),
//       child: Text(
//         '초기화하기',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 14,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     ),
//   );
// }
}