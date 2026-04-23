import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhohlaScreen extends StatefulWidget {
  final String title;
  final String content;

  const PhohlaScreen({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  State<PhohlaScreen> createState() => _PhohlaScreenState();
}

class _PhohlaScreenState extends State<PhohlaScreen> {
  double fontSize = 18;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,

      /// 🔝 APPBAR
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.black,
        ),

        title: Text(
          widget.title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),

        /// 🔠 FONT SIZE CONTROL
        actions: [
          IconButton(
            icon: Icon(
              Icons.text_decrease,
              color: isDark ? Colors.white : Colors.black,
            ),
            onPressed: () {
              setState(() {
                if (fontSize > 14) fontSize -= 2;
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.text_increase,
              color: isDark ? Colors.white : Colors.black,
            ),
            onPressed: () {
              setState(() {
                fontSize += 2;
              });
            },
          ),
        ],
      ),

      /// 📖 BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: buildLyrics(widget.content, isDark),
      ),
    );
  }

  /// 🎵 LYRICS BUILDER
  Widget buildLyrics(String lyrics, bool isDark) {
    final lines = lyrics.split('\n');

    bool isChorusBlock = false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lines.map((line) {
        final cleanLine = line.trim().toLowerCase();

        /// 🎯 START CHORUS
        if (cleanLine == "[chorus]") {
          isChorusBlock = true;
          return const SizedBox();
        }

        /// 🎯 END CHORUS
        if (cleanLine == "[/chorus]") {
          isChorusBlock = false;
          return const SizedBox();
        }

        final isHighlight = isChorusBlock;

        /// 🎯 SPACE BEFORE VERSES

        return Padding(
          padding: isHighlight
              ? const EdgeInsets.symmetric(vertical: 6, horizontal: 30)
              : const EdgeInsets.symmetric(vertical: 3),
          child: Text(
            line,
            textAlign: isHighlight ? TextAlign.center : TextAlign.left,

            /// 🔥 PREMIUM FONT STYLE
            style: GoogleFonts.lora(
              fontSize: isHighlight ? fontSize + 2 : fontSize,
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
              letterSpacing: isHighlight ? 0.2 : 0,
              height: 1.5,
            ),
          ),
        );
      }).toList(),
    );
  }
}
