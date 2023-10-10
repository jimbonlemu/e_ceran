
import 'package:e_ceran/Views/dashboard_menu/history_transaction_view.dart';
import 'package:e_ceran/Views/dashboard_view.dart';
import 'package:e_ceran/Views/splash_view.dart';
import 'package:e_ceran/Views/dashboard_menu/stuff_list_view.dart';
import 'package:e_ceran/Views/dashboard_menu/transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Navigates {
  static const String notFoundPage = 'NotFoundPage';
  static const String splashView = 'SplashView';
  static const String homeView = 'HomeView';
  static const String transactionView = 'TransactionView';
  static const String stuffListView = 'StuffListView';
  static const String historyTransactionView = 'HistoryTransactionView';
  static const String stuffListDetailView = 'StuffListDetailView';

  static Route<dynamic> routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case splashView:
        return PageTransition(
            child: const SplashView(), type: PageTransitionType.leftToRight);
      case homeView:
        return PageTransition(
            child: const HomeView(), type: PageTransitionType.leftToRight);
      case transactionView:
        return PageTransition(
            child: const TransactionView(),
            type: PageTransitionType.rightToLeft);
      case stuffListView:
        return PageTransition(
            child: const StuffListView(), type: PageTransitionType.rightToLeft);
      case historyTransactionView:
        return PageTransition(
            child: const HistoryTransactionView(),
            type: PageTransitionType.rightToLeft);
      case notFoundPage:
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
