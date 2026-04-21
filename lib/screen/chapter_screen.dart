import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChapterScreen extends StatelessWidget {
  final String title;
  final String content;
  final String audio; // keep but we won’t use it

  const ChapterScreen({
    super.key,
    required this.title,
    required this.content,
    required this.audio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔥 BIG TITLE
            Text(
              title.toUpperCase(),
              style: GoogleFonts.playfairDisplay(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),

            const SizedBox(height: 20),

            /// 📖 CONTENT
            Text(
              content,
              style: GoogleFonts.merriweather(
                fontSize: 16,
                height: 1.8,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
