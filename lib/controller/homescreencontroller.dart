import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timestoday/model/newsmodel.dart';

class HomeScreenController extends ChangeNotifier {
  late NewsModel newsModel;
  bool isloading = false;
  fetchData() async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=78c5d6cfcef74d7fbcc3436db55e768c");
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api Failed");
    }
    newsModel = NewsModel.fromJson(decodedData);
    isloading = false;
    notifyListeners();
  }

  // to share news
  void shareText({String textToShare = ""}) {
    try {
      Share.share(textToShare);
    } catch (e) {
      print("Error Sharing: $e");
    }
  }
}
