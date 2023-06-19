import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../constants/string_constant.dart';
import '../main.dart';

class ScrollArticle extends StatelessWidget {
  ScrollArticle();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return newsapi.apidataAll?.status == FutureStatus.pending
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              primary: false,
              reverse: true,
              shrinkWrap: true,
              itemCount: newsapi.apidataAll?.value?.data?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Row(
                    children: [
                      Image.network(
                        newsapi.apidataAll?.value!.data?[index].images ?? "",
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
                              "${newsapi.apidataAll?.value?.data?[index].title}",
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
                              "${newsapi.apidataAll?.value?.data?[index].decription}",
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
            );
    });
  }
}
