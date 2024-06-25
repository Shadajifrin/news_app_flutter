import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_flutter/model/newsmodel.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenController with ChangeNotifier {
  late News newsModel;
  bool isLoading = false;
  var baseUrl = "https://newsapi.org";
  fetchdata() async {
    isLoading = true;
    final url =
        "$baseUrl/v2/top-headlines?country=in&apiKey=a3f41224e1f145a49ffbc317364d50c4";
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    Map<String, dynamic> decodeData = {};
    if (response.statusCode == 200) {
      decodeData = jsonDecode(response.body);
    } else {
      print("Api Failed");
    }
    newsModel = News.fromJson(decodeData);
    isLoading = false;
    notifyListeners();
  }

  Future<void> launchURL(String url) async {
    final Uri url1 = Uri.parse(url);
    try {
      if (!await launchUrl(url1, mode: LaunchMode.inAppWebView)) {
        await launchUrl(url1, mode: LaunchMode.inAppWebView);
      } else {
        throw "Could not launch $url";
      }
    } catch (e) {
      print("Error launching URL: $e");
    }
    notifyListeners();
  }

  void shareText({String textToShare = ""}) {
    try {
      Share.share(textToShare);
    } catch (e) {
      print("Error sharing: $e");
    }
    notifyListeners();
  }
}
