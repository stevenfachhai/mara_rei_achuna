import 'package:flutter/material.dart';
import 'package:mara_rei_achuna/content/chapter_block.dart';

class ChapterScreen extends StatelessWidget {
  const ChapterScreen({
    Key? key,
    required this.titleNumber,
  }) : super(key: key);

  final int titleNumber;

  @override
  Widget build(BuildContext context) {
    final block = chapterBlock[titleNumber] ?? '';

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            block,
            style: const TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}
