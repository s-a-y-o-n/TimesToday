import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timestoday/controller/categorycontroller.dart';
import 'package:timestoday/view/widgets/news_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void fetchdata(BuildContext context) async {
    Provider.of<CategoryController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchdata(context);
    // CategoryController provider = Provider.of<CategoryController>(context);
    return Consumer<CategoryController>(
      builder: (context, provider,child){
      return DefaultTabController(
          length: provider.categoryList.length,
          initialIndex: 0,
          child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text('Categories'),
                bottom: TabBar(
                  tabs: List.generate(
                    provider.categoryList.length,
                    (index) => Tab(
                      text: provider.categoryList[index],
                    ),
                  ),
                  isScrollable: true,
                  onTap: (value) {
                    provider.onTap(index: value);
                  },
                ),
              ),
              body: provider.isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.separated(
                          itemBuilder: (contex, index) => NewsCard(
                              title: provider.newsModel.articles?[index].title
                                      .toString() ??
                                  "",
                              description: provider
                                      .newsModel.articles?[index].description
                                      .toString() ??
                                  "",
                              date:
                                  provider.newsModel.articles?[index].publishedAt,
                              imageUrl: provider
                                      .newsModel.articles?[index].urlToImage
                                      .toString() ??
                                  "",
                              contant: provider.newsModel.articles?[index].content
                                      .toString() ??
                                  "",
                              sourceName: provider.newsModel.articles?[index].source?.name.toString() ?? "",
                              url: provider.newsModel.articles?[index].url.toString() ?? ""),
                          separatorBuilder: (context, index) => Divider(
                                height: 20,
                              ),
                          itemCount: provider.newsModel.articles?.length ?? 0),
                    )));},
    );
  }
}
