import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terrabayt_uz/app/app_images.dart';

import '../../data/models/news_data.dart';

class ItemNews extends StatelessWidget {
  int categoryId;
  NewsData newsData;

  ItemNews({required this.categoryId, required this.newsData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white),
        height: 180,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/lola.jpg",
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }

  getSizedHowBox(double width) {
    return SizedBox(
      width: width,
    );
  }
}
