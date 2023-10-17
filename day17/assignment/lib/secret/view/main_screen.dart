import 'package:assignment/common/const/style.dart';
import 'package:assignment/common/utils/utils.dart';
import 'package:assignment/secret/controller/secrets_controller.dart';
import 'package:assignment/secret/controller/upload_controller.dart';
import 'package:assignment/secret/view/upload_screen.dart';
import 'package:assignment/user/view/logout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<SecretsController> {
  const MainScreen({super.key});

  static const String routeName = '/main';

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await controller.readSecrets();
      },
      child: Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          title: Text(
            '🔥라인드',
            style: Style.textStyle.copyWith(fontSize: 24),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(LogoutScreen.routeName);
              },
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        body: Obx(() {
          if (controller.secrets.value == null) {
            return const Center(
              child: Text('가져올 비밀 정보가 없습니다.'),
            );
          }
          return ListView.separated(
            itemCount: controller.secrets.value!.length,
            itemBuilder: (_, index) {
              var item = controller.secrets.value![index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      renderAuthor(item),
                      renderTime(item),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        height: 80,
                        child: Text(
                          item.secret,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Style.textStyle,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          renderReactionIcon(
                              icon: Icons.favorite_border, string: '좋아요'),
                          renderReactionIcon(
                              icon: Icons.comment_outlined, string: '댓글'),
                          renderReactionIcon(
                              icon: Icons.remove_red_eye, string: '조회수'),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, index) => const Divider(
              color: Colors.white,
            ),
          );
        }),
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            textStyle: Style.textStyle,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            Get.toNamed(UploadScreen.routeName);
            Get.lazyPut(() => UploadController());
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.local_fire_department_sharp),
              SizedBox(width: 4),
              Text('글쓰기'),
            ],
          ),
        ),
      ),
    );
  }

  renderAuthor(item) {
    return Row(
      children: [
        Icon(
          Icons.local_fire_department_sharp,
          color: item.authorName == '' ? Colors.grey : Colors.red,
        ),
        Text(
          item.authorName == '' ? '(인증되지 않은 사용자)' : item.authorName!,
          style: Style.textStyle,
        ),
      ],
    );
  }

  renderTime(item) {
    return Text(
      Utils.getTimeDiffFromCreatedTime(item.created),
      style: Style.textStyle.copyWith(
        color: Colors.grey,
        fontSize: 12,
      ),
    );
  }

  Widget renderReactionIcon({
    required IconData icon,
    required String string,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 16,
        ),
        SizedBox(width: 4),
        Text(
          string,
          style: Style.textStyle,
        ),
      ],
    );
  }
}
