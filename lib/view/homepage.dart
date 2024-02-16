import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timestoday/controller/homescreencontroller.dart';
import 'package:timestoday/view/searchscreen.dart';
import 'package:timestoday/view/widgets/news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  void fetchdata() async {
    await Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    HomeScreenController provider = Provider.of<HomeScreenController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("TimesToday"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Provider.of<HomeScreenController>(context).isloading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(10),
              child: ListView.separated(
                  itemBuilder: (context, index) => NewsCard(
                        title: provider.newsModel.articles?[index].title
                                .toString() ??
                            "",
                        description: provider
                                .newsModel.articles?[index].description
                                .toString() ??
                            "",
                        date: provider.newsModel.articles?[index].publishedAt,
                        imageUrl: provider.newsModel.articles?[index].urlToImage
                                .toString() ??
                            "",
                        contant: provider.newsModel.articles?[index].content
                                .toString() ??
                            "",
                        sourceName: provider
                                .newsModel.articles?[index].source?.name
                                .toString() ??
                            "",
                        url: provider.newsModel.articles?[index].url
                                .toString() ??
                            "",
                      ),
                  separatorBuilder: (context, index) => Divider(
                        height: 20,
                      ),
                  itemCount: provider.newsModel.articles?.length ?? 0),
            ),
    );
  }
}
