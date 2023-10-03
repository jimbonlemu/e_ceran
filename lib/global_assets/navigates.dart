import 'package:e_ceran/Views/home_view.dart';
import 'package:e_ceran/Views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Navigates {
  static const String notfound = 'SplashView';

  static const String splashView = 'SplashView';
  static const String homeView = 'HomeView';


  static Route<dynamic> routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case splashView:
        return PageTransition(
            child: const SplashView(), type: PageTransitionType.fade);
      case homeView:
        return PageTransition(
            child: const HomeView(), type: PageTransitionType.fade);
      case notfound:
        return PageTransition(
            child: const NotFoundPage('Halaman Tidak Ditemukan : 404'),
            type: PageTransitionType.fade);
      
      default:
        return PageTransition(
            child: const NotFoundPage('Halaman Tidak Ditemukan : 404'),
            type: PageTransitionType.fade);
    }
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
