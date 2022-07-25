import 'package:flutter/material.dart';
import 'package:mara_rei_achuna/screen/topic_screen.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

void setupGetIt() {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TopicScreen(
        titleList: const ['titleList'],
      ),
    );
  }
}
