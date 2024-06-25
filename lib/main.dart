import 'package:flutter/material.dart';
import 'package:news_app_flutter/controller/bottom_nav_controller.dart';
import 'package:news_app_flutter/controller/category_controller.dart';
import 'package:news_app_flutter/controller/homescreen_controller.dart';
import 'package:news_app_flutter/controller/search_controller.dart';
import 'package:news_app_flutter/controller/splash_controller.dart';
import 'package:news_app_flutter/view/mainpage.dart';
import 'package:news_app_flutter/view/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashController()),
        ChangeNotifierProvider(
          create: (context) => BottomNavController(),
        ),
        ChangeNotifierProvider(create: (context)=>HomeScreenController()),
        ChangeNotifierProvider(create: (context)=>CategoryController()),
        ChangeNotifierProvider(create: (context)=>SearchScreenController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<SplashController>(
          builder: (context, SplashController, _) {
            return SplashController.isLoading
                ? const SplashScreen()
                : const MainPage();
          },
        ),
      ),
    );
  }
}
