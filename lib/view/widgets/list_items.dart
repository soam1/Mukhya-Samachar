import 'package:flutter/material.dart';

import '../../model/news_model.dart';

class ListItems extends StatelessWidget {
  const ListItems({super.key, required this.list});

  final List<NewsModel> list;

  @override
  Widget build(BuildContext context) {
    if (list.isNotEmpty) {
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10.0),
            // color: Colors.teal,
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                // image: NetworkImage(
                //     "https://cdn.pixabay.com/photo/2017/01/31/11/22/blank-photo-frames-2023679_640.png"),
                image: NetworkImage("${list[index].urlToImage}"),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              padding: EdgeInsets.all(10.0),
              child: Text(
                "${list[index].title}",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
