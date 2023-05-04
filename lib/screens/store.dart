import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shop",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
                ),
                SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, -2),
                          color: Colors.grey.shade200,
                          blurRadius: 5,
                          spreadRadius: 5
                        )
                      ]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    // childAspectRatio: ,
                    children: List.generate(10, (index) =>
                        Container(
                          height: 200,
                          width: 200,
                          // color: Colors.blueGrey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "asset/images/lake.jpeg", height: 150, fit:BoxFit.fill,),
                              Text("Lake 1"),
                            ],
                          ),
                        ),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
