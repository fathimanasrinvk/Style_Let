import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:stylelet/core/constants/color.dart';

import '../controller/splash_controller.dart';


class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final splashScreenProvider = Provider.of<SplashScreenProvider>(context);

    if (splashScreenProvider.isLoading) {
      Future.delayed(Duration(seconds: 3), () {
        splashScreenProvider.setLoading(false);
        Navigator.pushReplacementNamed(context, '/signin');
      });
    }

    return Scaffold(
      backgroundColor: ColorTheme.maincolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/splash.png",height: 400,width: 400,),
          ],
        ),
      ),
    );
  }
}
