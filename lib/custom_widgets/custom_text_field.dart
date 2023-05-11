import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomTextField extends StatefulWidget {
  CustomTextField(this.callBackFunction);

  Function callBackFunction;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController ctr = TextEditingController();
  bool cross = false;
  String? value;
  // List foundItems = [];
  // List AllItems = [];
  dynamic data;
  var news_length;

  // void getData() async {
  //   setState(() {
  //     // _loading = true;
  //   });
  //   http.Response response =
  //   await http.get(Uri.parse("https://inshorts.deta.dev/news?category="));
  //   if (response.statusCode == 200) {
  //     data = response.body; //store response as string
  //     setState(() {
  //       AllItems = jsonDecode(data!)['data'] as List; //get all the data from json string superheros// just printed length of data
  //       // _loading = false;
  //     });
  //   }
  // }

  @override
  void initState() {
    // getData();
    // foundItems = AllItems;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade100, blurRadius: 3, spreadRadius: 3),
          ],
        ),
        child: TextField(
          controller: ctr,
            // onChanged: (change) {
            //   widget.callBackFunction(change);
            //   setState(() {
            //     foundItems = foundItems
            //         .where((items) => items.name.toLowerCase().contains(change.toLowerCase()))
            //         .toList();
            //   });
            // },
          onSubmitted: (change) {
            widget.callBackFunction(change);
            setState(() {
              value = change;
              if (value?.trim() == '' || value == null) {
                cross = false;
              } else {
                cross = true;
              }
            });
          },
          decoration: InputDecoration(
            hintText: "Search",
            border: OutlineInputBorder(borderSide: BorderSide.none),
            prefixIcon: Icon(Icons.search),
            suffixIcon: cross
                ? IconButton(
                    icon: Icon(Icons.highlight_remove),
                    onPressed: () {
                      ctr.clear();
                    },
                  )
                : null,
            isDense: true,
          ),
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
      ),
    );
  }
}
