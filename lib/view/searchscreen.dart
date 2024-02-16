import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timestoday/controller/searchscreencontroller.dart';
import 'package:timestoday/view/widgets/news_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textcontroller = TextEditingController();
    SearchScreenController provider =
        Provider.of<SearchScreenController>(context);
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 45,
                width: MediaQuery.sizeOf(context).width * 2 / 3,
                child: TextField(
                  controller: textcontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 3))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ElevatedButton(
                onPressed: () {
                  provider.searchdata(
                      searchText: textcontroller.text.toLowerCase());
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Text("Search"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blue[200])),
              ))
            ],
          ),
          Expanded(
              child: Provider.of<SearchScreenController>(context).isLoading ==
                      true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) => NewsCard(
                          title:
                              provider.newsModel?.articles?[index].title ?? "",
                          description:
                              provider.newsModel?.articles?[index].description ??
                                  "",
                          date:
                              provider.newsModel?.articles?[index].publishedAt,
                          imageUrl:
                              provider.newsModel?.articles?[index].urlToImage ??
                                  "",
                          contant:
                              provider.newsModel?.articles?[index].content ??
                                  "",
                          sourceName: provider
                                  .newsModel?.articles?[index].source?.name ??
                              "",
                          url: provider.newsModel?.articles?[index].url ?? ""),
                      separatorBuilder: (context, index) => Divider(
                            height: 20,
                          ),
                      itemCount: provider.newsModel?.articles?.length ?? 0))
        ],
      ),
    )));
  }
}
