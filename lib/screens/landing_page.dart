import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:practical5/custom_widgets/custom_text_field.dart';
import 'package:practical5/custom_widgets/filtered_data.dart';
import '../custom_widgets/clickable_artical.dart';
import '../custom_widgets/scroll_article.dart';
import 'home_page.dart';
import 'newspage.dart';

class LandingPage extends StatefulWidget {
  LandingPage({
    super.key,
  });

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List categories = ['Drinks & Smoothies','Fruits & Veggies',' Science & Tech', 'Business & Politics',];
  String? getValueFromChild;
  String? data;
  var news_length;
  bool _loading = false;

  void getData() async {
    setState(() {
      _loading = true;
    });
    http.Response response =
        await http.get(Uri.parse("https://inshorts.deta.dev/news?category="));
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      setState(() {
        news_length = jsonDecode(data!)['data']; //get all the data from json string superheros// just printed length of data
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

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
                    "Best Folk Medicine",
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
                      setState(() {
                        getValueFromChild = value;
                      });
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
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: Row(
                                children: List.generate(
                                  categories.length,
                                  (index) => Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 8),
                                    child: OutlinedButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(
                                              vertical: 17, horizontal: 15),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child:  Text(
                                        categories[index],
                                        style: TextStyle(color: Colors.black),
                                      ),
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
                                    "Main articles",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  Text(
                                    "See more",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            ClickableArticale(news_length: news_length, data: data),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "You have not finished reading",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "See more",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            ScrollArticle(news_length: news_length, data: data)
                          ],
                        )
                      // : ScrollArticle(news_length: news_length, data: data)

                  : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: List.generate(
                              6,
                              (index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        jsonDecode(data!)['data'][index]['imageUrl'],
                                        height: 100,
                                        width: 150,
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(
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
                                              jsonDecode(data!)['data'][index]['title'],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Times New Roman',
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              "4 days ago",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              jsonDecode(data!)['data'][index]['content'],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
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
