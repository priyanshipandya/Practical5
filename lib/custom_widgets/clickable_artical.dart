import 'dart:convert';
import 'package:flutter/material.dart';
import '../Models/news.dart';
import '../screens/newspage.dart';

class ClickableArticale extends StatefulWidget {
  ClickableArticale();

  @override
  State<ClickableArticale> createState() => _ClickableArticaleState();
}

class _ClickableArticaleState extends State<ClickableArticale> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: newsList.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(top: 8, right: 0, bottom: 16, left: 20),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsPage(
                    news: newsList[index],
                  ),
                ),
              );
            },
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Material(
                elevation: 7,
                child: AnimatedContainer(
                  height: 300,
                  width: 270,
                  duration: Duration(milliseconds: 300),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: "myimage$index",
                          transitionOnUserGestures: true,
                          child: Image.network(
                            newsList[index].imageUrl!,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Life"),
                              Text(
                                "2 days ago",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            newsList[index].title!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Times New Roman'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
