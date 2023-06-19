import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'Models/omdbapi.dart';
part 'api_service.g.dart';

class NewsAPI_Service = _NewsAPI_Service with _$NewsAPI_Service;

abstract class _NewsAPI_Service with Store{
  @observable
  ObservableList<bool>? starList;

  @observable
  ObservableList<Data?> favList = ObservableList<Data?>();

  @observable
  ObservableFuture<NewsModel?>? apidataAll;
  // ObservableFuture<NewsModel?>? apidataScience;
  // ObservableFuture<NewsModel?>? apidataPolitics;
  // ObservableFuture<NewsModel?>? apidataEntertainment;
  // ObservableFuture<NewsModel?>? apidataAutomobile;
  // ObservableFuture<NewsModel?>? apidataBusiness;
  // ObservableFuture<NewsModel?>? apidataNational;
  // ObservableFuture<NewsModel?>? apidataSports;
  // ObservableFuture<NewsModel?>? apidataStartup;
  // ObservableFuture<NewsModel?>? apidataTechnology;
  // ObservableFuture<NewsModel?>? apidataWorld;

  _NewsAPI_Service(){
    starList = ObservableList<bool>.of(List.filled(25, false));
    apidataAll = ObservableFuture<NewsModel?>(getAPIData());
  }

  @computed
  int? get apiLength => apidataAll?.value?.data?.length;


  @action
  void toggleStar(int index){
    starList?[index] = !(starList?[index] ?? true);
    if(starList?[index] == true){
      favList?.add(apidataAll?.value?.data?[index]);
    }else{
      favList?.removeAt(index);
    }
  }

  @action
  Future<NewsModel?> getAPIData() async{
    Uri uri = Uri.parse("https://inshorts-news.vercel.app/all");
    http.Response response = await http.get(uri);
    if(response.statusCode == 200){
       var data = jsonDecode(response.body);
       // print(data);
       return NewsModel.fromJson(data);
    }
    return null;
  }
}