import 'dart:async';
import 'package:e_ceran/Views/home_view.dart';
import 'package:e_ceran/global_assets/images_path.dart';
import 'package:flutter/material.dart';

import '../global_assets/navigates.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double _opacity = 0.0;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _opacity = 1.0;
      });
    }).then((_) => showSplashScreen());
  }

  showSplashScreen() async {
    return Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacementNamed(Navigates.homeView);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(seconds: 3),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImagesPath.logoPath,
              width: 250,
              height: 250,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}
