import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practical5/constants/string_constant.dart';
import 'package:practical5/screens/dec.dart';
import 'package:practical5/screens/home_page.dart';
import 'package:practical5/screens/inc.dart';
import 'store/api_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white));
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navKey = GlobalKey();
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

final newsapi = NewsAPI_Service();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "${StringConstants.bestFolkMedicine}",
      navigatorObservers: [routeObserver],
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/Inc': (context) => Inc(
              numbers: 0,
            ),
        '/Dec': (context) => Dec(),
      },
      navigatorKey: navKey,
      // home: HomePage(),
    );
  }
}
