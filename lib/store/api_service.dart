import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import '../Models/news_modal.dart';
part 'api_service.g.dart';

class NewsAPI_Service = _NewsAPI_Service with _$NewsAPI_Service;

abstract class _NewsAPI_Service with Store {

  @observable
  ObservableFuture<Observable<NewsModel>>? apidataAll;

  _NewsAPI_Service() {
    apidataAll = ObservableFuture<Observable<NewsModel>>(getAPIData());
  }

  @observable
  ObservableList<Data> favList = ObservableList<Data>.of([]);

  void toggleStar(int index, Data data){
    print(data.isFav);
    data.isFav = !(data.isFav);

    apidataAll?.value?.reportChanged();
    // if(data.isFav){
    //   favList.add(data);
    // }else{
    //   favList.remove(data);
    // }
  }



  // void toggleStar(int index){
  //
  //   if(item.isFav){
  //     favList.add(item);
  //   }else{
  //     print("came index: $index");
  //     print("removing index: ${apidataAll!.value!.data![index]}");
  //     // favList.remove(apidataAll!.value!.data![index]);
  //     favList.removeWhere((element) {
  //       return element.title == item.title;
  //     },);
  //   }
  // }


  @action
  Future<Observable<NewsModel>> getAPIData() async {
    Uri uri = Uri.parse("https://inshorts-news.vercel.app/technology");
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Observable(NewsModel.fromJson(data));
    }
    throw Exception('Empty News Modal');
  }
}
