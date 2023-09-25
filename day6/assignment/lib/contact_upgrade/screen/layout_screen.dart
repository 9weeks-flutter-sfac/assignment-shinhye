import 'package:assignment/contact_upgrade/screen/main_view/main_contact_view.dart';
import 'package:assignment/contact_upgrade/screen/main_view/main_history_view.dart';
import 'package:assignment/contact_upgrade/screen/main_view/main_setting_view.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen>
    with TickerProviderStateMixin {
  late TabController controller;

  int index = 0;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);
    controller.addListener(listener);
  }

  void listener() {
    index = controller.index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '내 연락처',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          MainContactView(),
          MainHistoryView(),
          MainSettingView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (index) {
          controller.animateTo(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            label: '연락처',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: '통화기록',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '설정',
          ),
        ],
      ),
    );
  }
}
