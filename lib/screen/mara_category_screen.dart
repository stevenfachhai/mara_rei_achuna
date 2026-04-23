import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mara_rei_achuna1/screen/song_list_screen.dart';
// 🔥 FIX THIS PATH

class MaraCategoryScreen extends StatelessWidget {
  const MaraCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),

        /// 🔥 PREMIUM TITLE FONT
        title: Text(
          "Mara hla",
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            buildButton(context, "Love Song", "love song"),
            buildButton(context, "Gospel Song", "gospel song"),
            buildButton(context, "Nation Song", "nation song"),
          ],
        ),
      ),
    );
  }

  /// 🔘 BUTTON BUILDER
  Widget buildButton(BuildContext context, String text, String category) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SongListScreen(category: category),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              text, // 👈 nice UI text
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
