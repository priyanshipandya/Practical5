import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import '../Models/news_modal.dart';
part 'api_service.g.dart';

class NewsAPI_Service = _NewsAPI_Service with _$NewsAPI_Service;

abstract class _NewsAPI_Service with Store {

  @observable
  ObservableFuture<NewsModel>? apidataAll;

  _NewsAPI_Service() {
    apidataAll = ObservableFuture<NewsModel>(getAPIData());
  }

  @observable
  ObservableList<Data> favList = ObservableList<Data>.of([]);

  @action
  void toggleStar(Data data){
    data.isFav = !(data.isFav);
    print(data.isFav);
    if(data.isFav){
      favList.add(data);
    }else{
      favList.remove(data);
    }
  }

  @action
  Future<NewsModel> getAPIData() async {
    Uri uri = Uri.parse("https://inshorts-news.vercel.app/technology");
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return NewsModel.fromJson(data);
    }
    throw Exception('Empty News Modal');
  }
}
