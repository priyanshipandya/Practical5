import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Models/omdbapi.dart';

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
  void toggleStar(int index){
    apiProviderStars[index] = !apiProviderStars[index];
    notifyListeners();
  }
}
