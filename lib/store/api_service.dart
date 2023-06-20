import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import '../Models/omdbapi.dart';
part 'api_service.g.dart';


class APIServiceUsingMobX{
  static APIServiceUsingMobX? _instance;
  APIServiceUsingMobX._();
  factory APIServiceUsingMobX() => _instance ??= APIServiceUsingMobX._();

  NewsModel? newsModal;
  late int length;


}


class NewsAPI_Service = _NewsAPI_Service with _$NewsAPI_Service;


abstract class _NewsAPI_Service with Store{
  @observable
  ObservableList<bool> myMainStarList = ObservableList<bool>.of(List.filled(25, false));

  @observable
  ObservableFuture<NewsModel?>? apidataAll;

  _NewsAPI_Service(){
    apidataAll = ObservableFuture<NewsModel?>(getAPIData());
  }

  @computed
  int? get apiLength => apidataAll?.value?.data?.length;


  @action
  void toggleStar(int index){
    myMainStarList[index] = !(myMainStarList[index]);
  }

  @action
  Future<NewsModel?> getAPIData() async{
      Uri uri = Uri.parse("https://inshorts-news.vercel.app/technology");
      http.Response response = await http.get(uri);
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return NewsModel.fromJson(data);
      }
      return null;
    }
}