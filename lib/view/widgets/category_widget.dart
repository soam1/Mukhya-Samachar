import 'package:flutter/material.dart';
import 'package:news_app/shared/constants.dart';
import 'package:news_app/view/widgets/list_items.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller =
        TabController(length: CategoryList.categoryItems.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabs: CategoryList.categoryItems.map((e) {
            return Container(
              child: Text(e),
            );
          }).toList(),
          isScrollable: true,
          controller: controller,
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            // children: CategoryList.categoryItems.map((e) => Text(e)).toList(),
            children:
                CategoryList.categoryItems.map((e) => ListItems()).toList(),
          ),
        ),
      ],
    );
  }
}
