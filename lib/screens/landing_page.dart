import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Best Folk Medicine",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 20,
              ),
              const Card(
                elevation: 10,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: Icon(Icons.search),
                    isDense: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    4,
                        (index) => Card(
                      elevation: 2,
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            // left: BorderSide(color: Colors.black12),
                            // right: BorderSide(color: Colors.black12),
                            // top: BorderSide(color: Colors.black26),
                            // bottom: BorderSide(color: Colors.black26),
                          ),
                        ),
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: const Text("Drinks & Smoothies"),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Main articles",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text("See more"),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    4,
                        (index) => Padding(
                      padding: EdgeInsets.only(
                          top: 8, right: 8, bottom: 16, left: 8),
                      child: Material(
                        // borderRadius: BorderRadius,
                        elevation: 7,
                        child: Container(
                          height: 270,
                          width: 240,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "asset/images/lake.jpeg",
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("Life"),
                                    Text("2 days ago"),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "From small house to duplex house images.",
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "You have not finished reading",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text("See more"),
                  ],
                ),
              ),
              Row(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Your everyday guide to health living",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        Text(
                          "4 days ago",
                        ),

                        Text("Best Folk Medicine provides relevant, accessible and trustworthy information that"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}