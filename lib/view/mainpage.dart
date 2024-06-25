import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/controller/bottom_nav_controller.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavController>(context)
          .myPages[Provider.of<BottomNavController>(context).selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Color.fromARGB(255, 38, 69, 39),
        buttonBackgroundColor: Color.fromARGB(255, 38, 69, 39),
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.category, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
        ],
        index: Provider.of<BottomNavController>(context).selectedIndex,
        onTap: Provider.of<BottomNavController>(context, listen: false).onItemTap,
      ),
    );
  }
}
