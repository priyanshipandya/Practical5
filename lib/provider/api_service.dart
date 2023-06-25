import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Models/news_modal.dart';
import 'package:practical5/store/api_service.dart';

class APIServiceUsingProvider{
  static APIServiceUsingProvider? _instance;
  APIServiceUsingProvider._internal();
  factory APIServiceUsingProvider() => _instance ??= APIServiceUsingProvider._internal();
  late int length;
  NewsModel? newsModel;
  Future<NewsModel?> getAPIData() async {
    if(newsModel == null){
      Uri uri = Uri.parse("https://inshorts-news.vercel.app/science");
      http.Response response = await http.get(uri);
      print('getting response');
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        newsModel = NewsModel.fromJson(data);
        length = newsModel?.data?.length ?? 0;
        return newsModel;
      }
      return null;
    }else{
      return newsModel;
    }
  }
}

class OperationsOnAPI extends ChangeNotifier{
  List<bool> apiProviderStars = List.filled(APIServiceUsingProvider().length, false);
  bool isSeeMore = false;
  void isSeeMoreEnabled(){
    isSeeMore = !isSeeMore;
  }

  void toggleStar(Data data){
    data.isFav = !data.isFav;
    if(data.isFav){
      NewsAPI_Service().favList.add(data);
    }else{
      NewsAPI_Service().favList.remove(data);
    }
    notifyListeners();
  }
}
