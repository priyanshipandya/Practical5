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
              builder: (context) {
                var favList = newsapi.apidataAll?.value?.value.data
                    ?.where((element) => element.isFav == true).toList();
                print(favList?.length);
                print(newsapi.favList.length);
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: favList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsPage(
                                  index: index,
                                  data: favList?[index],
                                  from: "fav",
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Image.network(
                                favList?[index].images ?? '',
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
                                      "${favList?[index].title ?? ''}",
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
                                      "${favList?[index].decription ?? ''}",
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
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
