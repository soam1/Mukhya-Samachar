import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/view/widgets/category_widget.dart';
import 'package:news_app/view/widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(NewsController());
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "News App",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  controller.changeThemeMode();
                },
                icon: Icon(controller.iconTheme()),
              ),
            ],
          ),
          body: PageView(
            onPageChanged: (index) {
              controller.changeNavBar(currIndex: index);
              print(index);
            },
            controller: pageController,
            children: [
              HomeWidget(),
              CategoryWidget(),
            ],
          ),
          bottomNavigationBar: GetBuilder<NewsController>(
            builder: (controller) {
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.index,
                onTap: (index) {
                  controller.changeNavBar(currIndex: index);
                  pageController.jumpToPage(index);
                  print(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_max_outlined),
                    activeIcon: Icon(Icons.home),
                    label: "Home",
                    tooltip: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.category_outlined),
                    activeIcon: Icon(Icons.category),
                    label: "Category",
                    tooltip: "Category",
                  ),
                ],
              );
            },
          ),
        ),
        onWillPop: () async {
          return await Get.dialog(AlertDialog(
            title: Text("Closing the app"),
            content: Text("Are you sure to close the app?"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Get.back(result: true);
                  },
                  child: Text("Close")),
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Cancel")),
            ],
          ));
        });
  }
}
