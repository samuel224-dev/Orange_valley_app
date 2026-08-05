import 'package:flutter/material.dart';
import 'package:orange_valley_caa/pages/home_page.dart';

void main() {
  runApp(orangevalleyapp());
}
class orangevalleyapp extends StatelessWidget {
  const orangevalleyapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}



