import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/controller/api_helper.dart';

import '../model/news_model.dart';

class NewsController extends GetxController {
  final box = GetStorage();

  IconData themeIcon = Icons.light;

  void changeThemeMode() {
    String? theme = box.read("theme");
    if (theme == null || theme == "dark") {
      Get.changeThemeMode(ThemeMode.light);
      box.write("theme", "light");
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      box.write("theme", "dark");
    }
    update();
  }

  IconData iconTheme() {
    String? theme = box.read("theme");
    if (theme == "dark") {
      return Icons.light_mode;
    } else {
      return Icons.dark_mode;
    }
  }

  int index = 0;

  void changeNavBar({required int currIndex}) {
    index = currIndex;
    update();
  }

  NewsHelper newsHelper = NewsHelper();

  List<NewsModel> list = [];

  void getHeadlines() async {
    list = await newsHelper.getHeadlines();
    update();
  }

  @override
  void onInit() {
    getHeadlines();
    super.onInit();
  }
}
