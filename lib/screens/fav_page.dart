import 'package:flutter/material.dart';

class FavPage extends StatelessWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourites",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
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
          ),
        ],
      ),

    );
  }
}
