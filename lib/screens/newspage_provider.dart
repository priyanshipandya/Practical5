// import 'package:flutter/material.dart';
// import 'package:practical5/constants/string_constant.dart';
// import 'package:provider/provider.dart';
// import '../main.dart';
// import '../provider/api_service.dart';
//
// class NewsPageProvider extends StatelessWidget {
//   NewsPageProvider({Key? key, this.index}) : super(key: key);
//   final index;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SizedBox(
//           width: double.infinity,
//           child: ChangeNotifierProvider(
//             create: (context) => OperationsOnAPI(),
//             child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                           child: Row(
//                             children: [
//                               IconButton(
//                                 icon: Icon(Icons.arrow_back_ios),
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                               ),
//                               Text(
//                                 "${StringConstants.back}",
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                 ),
//                               ),
//                               Spacer(),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 8.0),
//                                 child: Icon(Icons.share),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Hero(
//                           tag:
//                               "${APIServiceUsingProvider().newsModel?.data?[index].title}",
//                           child: Image.network(
//                             "${APIServiceUsingProvider().newsModel?.data?[index].images}",
//                             height: 280,
//                             width: double.infinity,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 15.0, vertical: 15),
//                           child: Text(
//                             "${APIServiceUsingProvider().newsModel?.data?[index].title}",
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Times New Roman'),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
//                           child: Row(
//                             children: [
//                               Text(
//                                 "${StringConstants.writtenByBestFolkMedicine}",
//                                 style: TextStyle(fontSize: 15),
//                               ),
//                               Spacer(flex: 5),
//                               Text(
//                                 "${newsapi.apidataAll?.value?.data?[index].author}",
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                               Spacer(flex: 1),
//                               IconButton(
//                                 onPressed: () {
//                                   context.read<OperationsOnAPI>().toggleStar(index);
//                                 },
//                                 icon: newsapi.apidataAll?.value?.data?[index].isFav ?? false
//
//                                     ? Icon(Icons.star)
//                                     : Icon(Icons.star_border_outlined),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 15),
//                           child: Text(
//                             "${APIServiceUsingProvider().newsModel?.data?[index].decription}",
//                             style: TextStyle(
//                                 fontFamily: 'Times New Roman',
//                                 fontStyle: FontStyle.italic,
//                                 fontSize: 17),
//                           ),
//                         ),
//                       ],
//                     ),
//           ),
//           ),
//         ),
//       );
//   }
// }
