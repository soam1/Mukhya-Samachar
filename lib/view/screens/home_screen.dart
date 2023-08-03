import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(NewsController());

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
          bottomNavigationBar: BottomNavigationBar(
            items: [BottomNavigationBarItem(icon: Icon(Icons.))],
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
