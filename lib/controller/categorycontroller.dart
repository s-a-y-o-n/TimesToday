import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:timestoday/model/newsmodel.dart';
import 'package:http/http.dart' as http;

class CategoryController extends ChangeNotifier {
  List<String> categoryList = [
    "Busines",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology"
  ];
  String category = "business";
  onTap({required int index}) {
    category = categoryList[index].toLowerCase();
    fetchData();
    notifyListeners();
  }

  late NewsModel newsModel;
  bool isLoading = false;

  void fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=78c5d6cfcef74d7fbcc3436db55e768c");
    print(category);
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api failed");
    }
    newsModel = NewsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}
