class NewsModel {
  String? category;
  int? countArticles;
  List<Data>? data;

  NewsModel({this.category, this.countArticles, this.data});

  NewsModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    countArticles = json['count-articles'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['category'] = this.category;
    data['count-articles'] = this.countArticles;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? author;
  String? decription;
  String? images;
  String? inshortsLink;
  String? readMore;
  String? time;
  String? title;

  Data(
      {this.author,
        this.decription,
        this.images,
        this.inshortsLink,
        this.readMore,
        this.time,
        this.title,
        });

  Data.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    decription = json['decription'];
    images = json['images'];
    inshortsLink = json['inshorts-link'];
    readMore = json['read-more'];
    time = json['time'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['decription'] = this.decription;
    data['images'] = this.images;
    data['inshorts-link'] = this.inshortsLink;
    data['read-more'] = this.readMore;
    data['time'] = this.time;
    data['title'] = this.title;
    return data;
  }
}