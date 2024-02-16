import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:timestoday/model/newsmodel.dart';
import 'package:http/http.dart' as http;

class SearchScreenController extends ChangeNotifier {
  NewsModel? newsModel;
  bool isLoading = false;

  Future<void> searchdata({required String searchText}) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchText&sortBy=popularity&apiKey=78c5d6cfcef74d7fbcc3436db55e768c");
    try {
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        newsModel = NewsModel.fromJson(decodedData);
      } else {
        print("Api Failed");
      }
    } catch (e) {
      print("Error $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
