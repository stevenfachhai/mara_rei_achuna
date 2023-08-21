import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mara_rei_achuna1/story/phopa.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({
    Key? key,
    required this.titleNumber,
  }) : super(key: key);

  final int titleNumber;

  @override
  Widget build(BuildContext context) {
    final story = phopa[titleNumber] ?? '';

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
                      height:
                          18), // Add some spacing between icon and text content
                  Text(
                    story,
                    style: GoogleFonts.libreBaskerville(
                      textStyle: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    textAlign: TextAlign.justify, // Add this line
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
