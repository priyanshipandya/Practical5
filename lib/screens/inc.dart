import 'package:flutter/material.dart';
import 'package:practical5/main.dart';

import '../constants/string_constant.dart';
import 'home_page.dart';

class Inc extends StatefulWidget{
  Inc({Key? key,required this.numbers}) : super(key: key);
  final numbers;
  @override
  State<Inc> createState() => _IncState();
}

class _IncState extends State<Inc> with RouteAware{
  int number = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
     number = widget.numbers;
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
    super.initState();
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
                    "${StringConstants.increment}",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => navKey.currentState?.pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                            (route) => false),
                    icon: Icon(Icons.home),
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "${StringConstants.youPressedTheButton}",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '$number',
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
              heroTag: '${StringConstants.button1}',
              onPressed: () {
                setState(() {
                  number++;
                });
              },
              child: Icon(Icons.add),
            ),
            SizedBox(
              width: 20,
            ),
            FloatingActionButton(
              heroTag: '${StringConstants.button2}',
              onPressed: () {
                setState(() {
                  Navigator.of(context).pushNamed('/Dec', arguments: number);
                });
              },
              child: Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  @override
  void didPopNext() {
    print("Did Pop Next");
  }
  @override
  void didPush() {
    print("Did Push");
  }

  @override
  void didPop() {
    print("Did Pop");
  }

  @override
  void didPushNext() {
    print("Did Push Next");
  }
}
