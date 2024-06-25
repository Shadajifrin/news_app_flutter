import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app_flutter/controller/splash_controller.dart';
import 'package:news_app_flutter/utils/colors.dart';

import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController = Provider.of<SplashController>(context);
    Future.delayed(const Duration(seconds: 5), () {
      splashController.setLoading(false);
    });
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
         children: [
          Text("NEWS TODAY",style: NewsText.textSplash,),
          if(splashController.isLoading)
          LottieBuilder.asset("assets/animations/test.json",
          fit: BoxFit.contain
          ,
          repeat: true,
          height: 150,
          width: 150,
          )
         ],
        ),
      ),
    );
  }
}
