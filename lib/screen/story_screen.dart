import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mara_rei_achuna1/story/phopa.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({
    Key? key,
    required this.titleNumber,
  }) : super(key: key);

  final int titleNumber;

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  int likeCount = 1;
  bool isLiked = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        likeCount++;
      } else {
        likeCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final story = phopa[widget.titleNumber] ?? '';

    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    story,
                    style: GoogleFonts.libreBaskerville(
                      textStyle: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleLike,
        child: Icon(
          isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Adjust alignment
            children: [
              Row(
                children: [
                  Icon(
                    Icons.thumb_up,
                    size: 15,
                  ),
                  SizedBox(width: 8), // Add spacing between icon and text
                  Text(
                    'Likes: ${likeCount}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // You can add other widgets here if needed
            ],
          ),
        ),
      ),
    );
  }
}
