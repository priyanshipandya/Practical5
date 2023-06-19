import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../api_service.dart';
import '../constants/string_constant.dart';
import '../main.dart';
import '../screens/newspage.dart';

class ClickableArticale extends StatefulWidget {
  ClickableArticale();

  @override
  State<ClickableArticale> createState() => _ClickableArticaleState();
}

class _ClickableArticaleState extends State<ClickableArticale> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => SizedBox(
        height: 320,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: newsapi.apidataAll?.value?.data?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 8, right: 0, bottom: 16, left: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NewsPage(index: index, newsapi: newsapi),
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
                      child: newsapi.apidataAll?.status == FutureStatus.pending
                          ? Center(child: CircularProgressIndicator())
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag:
                                      "${newsapi.apidataAll?.value?.data?[index].title}",
                                  transitionOnUserGestures: true,
                                  child: Image.network(
                                    "${newsapi.apidataAll?.value?.data?[index].images}",
                                    height: 180,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("${StringConstants.life}"),
                                      Text(
                                        "${StringConstants.twoDaysAgo}",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Text(
                                    "${newsapi.apidataAll?.value?.data?[index].title}",
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
            );
          },
        ),
      ),
    );
  }
}
