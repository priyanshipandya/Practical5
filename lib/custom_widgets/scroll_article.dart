import 'dart:convert';

import 'package:flutter/material.dart';

class ScrollArticle extends StatelessWidget {
  const ScrollArticle({Key? key, required this.news_length, required this.data})
      : super(key: key);
  final news_length;
  final String? data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        news_length != null ? news_length.length : 0,
        (index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Row(
              children: [
                Image.network(
                  jsonDecode(data!)['data'][index]['imageUrl'],
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
                        jsonDecode(data!)['data'][index]['title'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            fontFamily: 'Times New Roman'),
                      ),
                      Text(
                        "4 days ago",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        jsonDecode(data!)['data'][index]['content'],
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
