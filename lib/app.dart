

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:total_score_page/presentation/screens/main_screen.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
