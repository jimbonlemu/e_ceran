import 'package:e_ceran/Views/home_view.dart';
import 'package:e_ceran/Views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Navigates {


  static const String splashView = 'SplashView';
  static const String homeView = 'HomeView';

  static Route<dynamic> routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case splashView:
        return PageTransition(
            child: const SplashView(), type: PageTransitionType.leftToRight);
      case homeView:
        return PageTransition(
            child: const HomeView(), type: PageTransitionType.leftToRight);
      default:
        return PageTransition(
            child: const NotFoundPage('Halaman Tidak Ditemukan : 404'),
            type: PageTransitionType.fade);
    }
  }
}

class NotFoundPage extends StatelessWidget {
  final String title;
 
   const NotFoundPage(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Arimo_bold',
              color: Colors.black,
              letterSpacing: 2.5,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
