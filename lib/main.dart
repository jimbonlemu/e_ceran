import 'package:flutter/material.dart';
import 'global_assets/navigates.dart';

void main() {
  
  runApp(const MainRun());
}

class MainRun extends StatelessWidget {
  const MainRun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Ceran',
      onGenerateRoute: Navigates.routeGenerator,
      initialRoute: Navigates.stuffListView,
    );
  }
}
