import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/news_modal.dart';
import '../provider/api_service.dart';

class ScrollArticle extends StatelessWidget {
  ScrollArticle();

  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => APIServiceUsingProvider().getAPIData(),
      initialData: null,
      child: Consumer<NewsModel?>(
        builder: (context, newsApi, child) => newsApi?.data?.isEmpty ?? true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: 7 ,
                // APIServiceUsingProvider().newsModel?.data?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Row(
                      children: [
                        Image.network(
                          APIServiceUsingProvider()
                                  .newsModel
                                  ?.data?[index]
                                  .images ??
                              "",
                          height: 100,
                          width: 150,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${newsApi?.data?[index].title}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    fontFamily: 'Times New Roman'),
                              ),
                              Text(
                                "${APIServiceUsingProvider().newsModel?.data?[index].time}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              Text(
                                "${APIServiceUsingProvider().newsModel?.data?[index].decription}",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
