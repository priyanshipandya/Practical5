import 'package:flutter/material.dart';
import 'package:practical5/main.dart';

class Inc extends StatefulWidget{
  Inc({Key? key,required this.numbers}) : super(key: key);
  final numbers;
  @override
  State<Inc> createState() => _IncState();
}

class _IncState extends State<Inc> {
  int number = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
     number = widget.numbers;
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
                    "Increment",
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
              heroTag: 'button 1',
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
              heroTag: 'button 2',
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
}
