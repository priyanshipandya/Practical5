import 'dart:convert';

import 'package:flutter/material.dart';

import '../Models/news.dart';
import '../constants/string_constant.dart';

class ScrollArticle extends StatelessWidget {
  const ScrollArticle();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        newsList.length,
        (index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Row(
              children: [
                Image.network(
                  newsList[index].imageUrl!,
                  height: 100,
                  width: 150,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        newsList[index].title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            fontFamily: 'Times New Roman'),
                      ),
                      Text(
                        "${StringConstants.fourDaysAgo}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        newsList[index].content!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
