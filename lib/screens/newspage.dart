import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practical5/constants/string_constant.dart';

import '../Models/news.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key? key, required this.news}) : super(key: key);
  final News news;

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  bool star = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        "${StringConstants.back}",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.share),
                      ),
                    ],
                  ),
                ),
                Hero(

                  tag: 'myimage${widget.news.title}',
                  child: Image.network(
                    widget.news.imageUrl!,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Text(
                    widget.news.title!,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Times New Roman'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                  child: Row(
                    children: [
                      Text(
                        "${StringConstants.writtenByBestFolkMedicine}",
                        style: TextStyle(fontSize: 15),
                      ),
                      Spacer(flex: 5),
                      Text(
                        "${StringConstants.writtenByBestFolkMedicine}",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Spacer(flex: 1),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            star = !star;
                          });
                        },
                        icon: star
                            ? Icon(Icons.star)
                            : Icon(Icons.star_border_outlined),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    widget.news.content!,
                    style: TextStyle(fontFamily: 'Times New Roman', fontStyle: FontStyle.italic, fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
