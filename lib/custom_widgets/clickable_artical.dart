import 'dart:convert';

import 'package:flutter/material.dart';

import '../screens/newspage.dart';

class ClickableArticale extends StatefulWidget {
   ClickableArticale({Key? key, this.news_length, required this.data}) : super(key: key);
  final  news_length;
  final String? data;
  @override
  State<ClickableArticale> createState() => _ClickableArticaleState();
}

class _ClickableArticaleState extends State<ClickableArticale> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
          List.generate(
            widget.news_length == null
                ? 0
                : widget.news_length.length,
                (index) => Padding(
              padding: EdgeInsets.only(
                  top: 8, right: 0, bottom: 16, left: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsPage(
                        index: index,
                        data: widget.data,
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
                      duration:
                      Duration(milliseconds: 300),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: "myimage$index",
                              transitionOnUserGestures:
                              true,
                              child: Image.network(
                                jsonDecode(widget.data!)['data']
                                [index]['imageUrl'],
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets
                                  .symmetric(
                                  vertical: 10.0,
                                  horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                children: const [
                                  Text("Life"),
                                  Text(
                                    "2 days ago",
                                    style: TextStyle(
                                        color:
                                        Colors.grey,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsets.symmetric(
                                  horizontal: 15.0),
                              child: Text(
                                jsonDecode(widget.data!)['data']
                                [index]['title'],
                                maxLines: 3,
                                overflow:
                                TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight:
                                    FontWeight.bold,
                                    fontFamily:
                                    'Times New Roman'),
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
        )
    );
  }
}
