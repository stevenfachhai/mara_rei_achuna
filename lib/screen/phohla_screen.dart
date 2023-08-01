import 'package:flutter/material.dart';
import 'package:mara_rei_achuna/song/song_lyrics.dart';

class PhohlaScreen extends StatelessWidget {
  const PhohlaScreen({
    Key? key,
    required this.titleNumber,
  }) : super(key: key);

  final int titleNumber;

  @override
  Widget build(BuildContext context) {
    final song = songLyrics[titleNumber] ?? '';

    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  const SizedBox(
                      height:
                          16), // Add some spacing between icon and text content
                  Text(
                    song,
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
