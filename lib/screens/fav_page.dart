import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../constants/string_constant.dart';
import '../main.dart';
import 'newspage_mobx.dart';

class FavPage extends StatelessWidget {
  FavPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "${StringConstants.favourites}",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Observer(
              builder: (context) => Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: newsapi.myMainStarList?.length,
                  itemBuilder: (context, index) {
                    return newsapi.myMainStarList[index]
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewsPage(
                                        index: index,
                                        ),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Image.network(
                                    newsapi.apidataAll?.value?.data?[index].images ?? "",
                                    height: 100,
                                    width: 150,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                            ),
                          )
                        : SizedBox.shrink();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
