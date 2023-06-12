class News{
  String? title;
  String? content;
  String? imageUrl;

  News.fromJson(Map data){
    this.title = data['title'];
    this.content = data['description'];
    this.imageUrl = data['urlToImage'];
  }
}


List<News> newsList = [];



