import 'package:flutter/material.dart';
import 'package:news_app_flutter/view/category.dart';

import 'package:news_app_flutter/view/home.dart';
import 'package:news_app_flutter/view/search.dart';

class BottomNavController with ChangeNotifier {
  int selectedIndex = 0;
  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages = [
    HomeScreen(),
    CategoryScreen(),
    SearchScreen(),
  ];
}
