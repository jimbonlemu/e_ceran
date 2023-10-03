import 'package:flutter/material.dart';
import '../global_assets/widgets/app_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarFormat(
        styledAppBarTitle: 'Hello World',
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('hap')],
          ),
        ));
  }
}
