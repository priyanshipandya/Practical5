import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key? key, required this.index}) : super(key: key);
  final int index;

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
                        "Back",
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
                  tag: 'myimage${widget.index}',
                  child: Image.asset(
                    "asset/images/lake.jpeg",
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Text(
                    "Your everyday guide to health living. Best Folk Medicine provides relevant, accessible and trustworthy",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'InstrumentSerif'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                  child: Row(
                    children: [
                      Text(
                        "Written by bestfolkmedicine",
                        style: TextStyle(fontSize: 15),
                      ),
                      Spacer(flex: 5),
                      Text(
                        "2 days ago",
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
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
                    "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). ",
                    style: TextStyle(fontFamily: 'InstrumentSerif', fontStyle: FontStyle.italic, fontSize: 17),
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
