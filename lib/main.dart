import 'package:flutter/material.dart';
import 'package:mara_rei_achuna/screen/home_screen.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

void setupGetIt() {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
