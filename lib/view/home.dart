import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app_flutter/controller/homescreen_controller.dart';
import 'package:news_app_flutter/view/search.dart';
import 'package:news_app_flutter/widget/news_card.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {

  void fetchData(BuildContext context) {
    Provider.of<HomeScreenController>(context, listen: false).fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    fetchData(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 38, 69, 39),
          elevation: 0,
          title: const Text(
            "News Today 🗞️",
          ),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20,
            fontWeight: FontWeight.w600),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
              icon: Icon(Icons.search,color: Colors.white,),
            )
          ],
        ),
    body: Consumer<HomeScreenController>(builder: (context, provider, child) {
          return provider.isLoading == true
              ? Center(
                  child: LottieBuilder.asset(
                  "assets/animations/test.json",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                ))
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.separated(
                      itemBuilder: (context, index) => NewsCard(
                            title: provider.newsModel.articles?[index].title.toString() ?? "",
                            description: provider.newsModel.articles?[index].description
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
                            sourceName: provider
                                    .newsModel.articles?[index].source?.name
                                    .toString() ??
                                "",
                            url: provider.newsModel.articles?[index].url
                                    .toString() ??
                                "",
                          ),
                      separatorBuilder: (context, index) => const Divider(
                            height: 20,
                          ),
                      itemCount: provider.newsModel.articles?.length ?? 0),
                );
        }));
  }
}