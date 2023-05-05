import 'package:flutter/material.dart';
import 'package:practical5/custom_widgets/custom_text_field.dart';
import 'newspage.dart';

class LandingPage extends StatefulWidget {
  LandingPage({
    super.key,
  });

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String? getValueFromChild;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
                ? Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            4,
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
                                child: const Text(
                                  "Drinks & Smoothies",
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Main articles",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              "See more",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            6,
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
                                      ),
                                    ),
                                  );
                                },
                                child: Material(
                                  elevation: 7,
                                  child: AnimatedContainer(
                                    height: 300,
                                    width: 270,
                                    duration: Duration(milliseconds: 300),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Hero(
                                          tag: "myimage$index",
                                          transitionOnUserGestures: true,
                                          child: Image.asset(
                                            "asset/images/lake.jpeg",
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
                                              Text("Life"),
                                              Text(
                                                "2 days ago",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: Text(
                                            "From small house to duplex house images near the lake in the wooden house.",
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "You have not finished reading",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "See more",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      ...List.generate(
                        6,
                        (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: Row(
                              children: [
                                Image.asset(
                                  "asset/images/landscape.jpeg",
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Your everyday guide to health living",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        "4 days ago",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Best Folk Medicine provides relevant, accessible and trustworthy information that",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: List.generate(
                        6,
                        (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Image.asset(
                                  "asset/images/landscape.jpeg",
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Your everyday guide to health living",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        "4 days ago",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Best Folk Medicine provides relevant, accessible and trustworthy information that",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
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
