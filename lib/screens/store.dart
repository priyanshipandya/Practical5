import 'package:flutter/material.dart';
import 'package:practical5/Models/store.dart';
import '../constants/string_constant.dart';
import '../custom_widgets/custom_text_field.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  List<Book> filteredBooks = [];
  String? getValueFromChild;

  getBooks() {
    setState(() {
      BookList = [];
      filteredBooks = [];
      BookStore.forEach((key, value) {
        BookList.add(Book(key, value));
      });
    });
    filteredBooks = List.from(BookList);
  }

  @override
  void initState() {
    super.initState();
    getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${StringConstants.shop}",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField((String value) {
                setState(() {
                  getValueFromChild = value;
                  filteredBooks = [];

                  BookList.forEach((element) {
                    if (element.title!
                        .toLowerCase()
                        .contains(getValueFromChild!.toLowerCase())) {
                      filteredBooks.add(element);
                    }
                  });
                });
              }),
              getValueFromChild == null ||
                      getValueFromChild!.trim() == ''
                  ? Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio:
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? 0.7
                                          : 1.25),
                          itemBuilder: (context, index) {
                            return Container(
                              height: 180,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "asset/images/${BookStore.keys.elementAt(index)}",
                                    height: 130,
                                    width: 100,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      BookStore.values.elementAt(index),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: filteredBooks.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio:
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? 0.7
                                          : 1.25),
                          itemBuilder: (context, index) {
                            return Container(
                              height: 180,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "asset/images/${filteredBooks[index].image!}",
                                    height: 130,
                                    width: 100,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      filteredBooks[index].title!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
