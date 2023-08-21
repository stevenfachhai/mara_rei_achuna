import 'package:flutter/material.dart';
import 'package:mara_rei_achuna1/song/song_image.dart';
import 'package:mara_rei_achuna1/song/song_lyrics.dart';

class PhohlaScreen extends StatelessWidget {
  const PhohlaScreen({
    Key? key,
    required this.titleNumber,
  }) : super(key: key);

  final int titleNumber;

  @override
  Widget build(BuildContext context) {
    final image = songImage[titleNumber] ?? '';
    final song = songLyrics[titleNumber] ?? '';

    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  const SizedBox(height: 0),
                  InteractiveViewer(
                    minScale: 1.0,
                    maxScale: 4.0, // Adjust the maximum zoom level as needed
                    child: Image.network(
                      image, // Use the image URL or replace with asset path if using assets
                      // Set the width as per your requirement
                      fit: BoxFit
                          .fill, // Set the appropriate fit to fully contain the image
                    ),
                    onInteractionStart: (details) {
                      // Prevent the parent scroll view from scrolling when zooming the image
                      Scrollable.ensureVisible(context);
                    },
                    onInteractionUpdate: (details) {
                      // Handle panning when the user moves the zoomed image
                      if (details.scale != 1.0) {
                        Scrollable.ensureVisible(context);
                      }
                    },
                  ),
                  const SizedBox(height: 16),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popUntil(context, (route) => route.isFirst);
        },
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
    );
  }
}
