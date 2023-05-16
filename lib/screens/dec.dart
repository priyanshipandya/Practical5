import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practical5/Navigation/custom_page_route.dart';

import '../main.dart';
import 'inc.dart';

class Dec extends StatefulWidget {
  const Dec({Key? key}) : super(key: key);

  @override
  State<Dec> createState() => _DecState();
}

class _DecState extends State<Dec> {
  int number = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (ModalRoute.of(context)!.settings.arguments != null) {
      number = ModalRoute.of(context)!.settings.arguments as int;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Decrement",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => navKey.currentState?.popUntil((route) => route.isFirst),
                    icon: Icon(Icons.home),
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "You pressed the button",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "$number",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            FloatingActionButton(
              heroTag: 'button 1',
              onPressed: () {
                setState(() {
                  number--;
                });
              },
              child: Icon(CupertinoIcons.minus),
            ),
            SizedBox(
              width: 20,
            ),
            FloatingActionButton(
              heroTag: 'button 2',
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(
                    CustomPageRoute(page: Inc(numbers: number,),),
                  );
                });
              },
              child: Icon(Icons.arrow_back_ios_new_rounded),
            ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
