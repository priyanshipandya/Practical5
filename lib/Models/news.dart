class News{
  String? title;
  String? content;
  String? imageUrl;

  News.fromJson(Map data){
    this.title = data['title'];
    this.content = data['content'];
    this.imageUrl = data['imageUrl'];
  }
}

List<News> newsList = [];



