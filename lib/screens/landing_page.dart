import 'package:flutter/material.dart';
import 'package:practical5/constants/string_constant.dart';
import 'package:practical5/custom_widgets/custom_text_field.dart';
import '../custom_widgets/clickable_artical.dart';
import '../custom_widgets/scroll_article.dart';

class LandingPage extends StatelessWidget {
  LandingPage({
    super.key,
  });


  List categories = [
    'Science',
    'Politics',
    'Entertainment',
    'Automobile',
    'Business',
    'National',
    'Sports',
    'Startup',
    'Technology',
    'World',
  ];

  String? getValueFromChild;

  bool _loading = false;

  // void getData() async {
  //
  //     _loading = true;
  //     newsList = [];
  //     filteredNews = [];
    //
    // http.Response response =
    //     await http.get(Uri.parse("https://inshorts.deta.dev/news?category="));
    // if (response.statusCode == 200) {
    //   var data = response.body;
    //   setState(() {
    //     List news_data_list = jsonDecode(data)['data'];
    //
    //     for (int i = 0; i < news_data_list.length; i++) {
    //       newsList.add(News.fromJson(news_data_list[i]));
    //     }
    //     print(newsList.map((e) => e.title));
    //     _loading = false;
    //   });
    //
    //   filteredNews = List.from(newsList);
    // }
  // }

  // List<News> filteredNews = [];

  // @override
  // void initState() {
  //   // getData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(child: CircularProgressIndicator())
        : SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "${StringConstants.bestFolkMedicine}",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Dosis',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: CustomTextField((String value) {
                      // setState(() {
                      //   getValueFromChild = value;
                      //   filteredNews = [];
                      // });
                      // newsList.forEach((e) {
                      //   if (e.title!
                      //           .toLowerCase()
                      //           .contains(getValueFromChild!.toLowerCase()) ||
                      //       e.content!
                      //           .toLowerCase()
                      //           .contains(getValueFromChild!.toLowerCase())) {
                      //     // setState(() {
                      //     //   filteredNews.add(e);
                      //     // });
                      //   }
                      //   ;
                      // });
                      // print(filteredNews.length);
                      // print(getValueFromChild);
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  getValueFromChild == null || getValueFromChild?.trim() == ''
                      // ? ScrollArticle(news_length: news_length, data: data)
                      ? Column(
                          children: [
                            SizedBox(
                              height: 60,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: categories.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 8),
                                  child: OutlinedButton(
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            vertical: 17, horizontal: 15),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      categories[index],
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "${StringConstants.mainArticles}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  Text(
                                    "${StringConstants.seeMore}",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            ClickableArticale(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "${StringConstants.youhaveNotFinishedReading}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "${StringConstants.seeMore}",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            ScrollArticle()
                          ],
                        ) :
                  SizedBox.shrink(),
                  //      ScrollArticle(news_length: news_length, data: data)

                      // : Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: 20.0),
                      //     child: Column(
                      //       children: List.generate(
                      //         filteredNews.length,
                      //         (index) {
                      //           return Padding(
                      //             padding: EdgeInsets.symmetric(vertical: 5),
                      //             child: Row(
                      //               children: [
                      //                 Image.network(
                      //                   filteredNews[index].imageUrl!,
                      //                   height: 100,
                      //                   width: 150, //niche pn
                      //                   fit: BoxFit.fill,
                      //                 ),
                      //                 SizedBox(
                      //                   width: 10,
                      //                 ),
                      //                 Expanded(
                      //                   child: Column(
                      //                     crossAxisAlignment:
                      //                         CrossAxisAlignment.start,
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.start,
                      //                     children: [
                      //                       Text(
                      //                         filteredNews[index].title!,
                      //                         maxLines: 2,
                      //                         overflow: TextOverflow.ellipsis,
                      //                         style: TextStyle(
                      //                             fontWeight: FontWeight.w600,
                      //                             fontFamily: 'Times New Roman',
                      //                             fontSize: 18),
                      //                       ),
                      //                       Text(
                      //                         "${StringConstants.fourDaysAgo}",
                      //                         style: TextStyle(
                      //                             fontWeight: FontWeight.bold),
                      //                       ),
                      //                       Text(
                      //                         filteredNews[index]
                      //                             .content!,
                      //                         maxLines: 2,
                      //                         overflow: TextOverflow.ellipsis,
                      //                         style:
                      //                             TextStyle(color: Colors.grey),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           );
                      //         },
                      //       ),
                      //     ),
                      //   ),
                // ],
              ]),
            ),
          );
  }
}
