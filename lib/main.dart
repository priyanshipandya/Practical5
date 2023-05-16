import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practical5/screens/home_page.dart';
import 'package:practical5/screens/inc.dart';
import 'package:practical5/screens/dec.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navKey = GlobalKey();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Best Folk Medicine",
      initialRoute: '/',
      routes: {
        '/' : (context) => HomePage(),
        '/Inc' : (context) => Inc(numbers: 0,),
        '/Dec' : (context) => Dec(),
      },
      navigatorKey: navKey,
      // home: HomePage(),
    );
  }
}
