import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  static const String routeName = '/main';

  @override
  Widget build(BuildContext context) {
    var user = Get.find<AuthController>().getUser;

    return Scaffold(
      bottomNavigationBar: renderBottomNavigationBar(),
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          children: [
            renderHome(user),
            renderMy(user),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.readDocuments();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  renderBottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.curPage.value,
        onTap: controller.onPageTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
        ],
      ),
    );
  }

  renderHome(user) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              '${user?.name ?? 'anonymous'}님, 안녕하세요',
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            if (controller.documents.value != null)
              ...controller.documents.value!
                  .map(
                    (data) => ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(data.title),
                          Text(
                            '[보안등급: ${data.sec_level}]',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.content),
                          if (data.attachment_url != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.network(data.attachment_url!),
                            ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
          ],
        ),
      ),
    );
  }

  renderMy(user) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
                // backgroundImage: NetworkImage(user.avatar),
                ),
            title: Text(user?.username ?? 'username'),
            subtitle: Text(user?.name ?? 'user'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('로그아웃하기'),
              onTap: () {
                controller.curPage(0);
                controller.pageController.jumpTo(0);
                controller.documents.value?.clear();
                print(controller.documents.value);
                controller.logout();
              },
            ),
          ),
        ],
      ),
    );
  }
}
