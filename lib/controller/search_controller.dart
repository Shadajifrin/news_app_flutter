import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_flutter/model/newsmodel.dart';


class SearchScreenController with ChangeNotifier {
  News? newsModel;
  bool isLoading = false;
  Future<void> searchData({required String searchText}) async {
    isLoading = true;
    final url = Uri.parse("https://newsapi.org/v2/everything?q=$searchText&sortBy=publishedAt&apiKey=a3f41224e1f145a49ffbc317364d50c4");
    try {
      final response = await http.get(url,
        headers: {
          'Content-Type': 'application/json',
        },);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        newsModel = News.fromJson(decodedData);
      } else {
        print("Api failed");// Handle the failure case as needed.
      }
    } catch (e) {
      print("Error: $e");// Handle the error case as needed.
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}