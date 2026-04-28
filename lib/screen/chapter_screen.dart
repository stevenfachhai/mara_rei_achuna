import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChapterScreen extends StatefulWidget {
  final String title;
  final String content;
  final String audio;

  const ChapterScreen({
    super.key,
    required this.title,
    required this.content,
    required this.audio,
  });

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  double fontSize = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),

        title: Text(
          widget.title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        /// 🔠 FONT SIZE CONTROL
        actions: [
          IconButton(
            icon: const Icon(Icons.text_decrease, color: Colors.black),
            onPressed: () {
              setState(() {
                if (fontSize > 14) fontSize -= 2;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.text_increase, color: Colors.black),
            onPressed: () {
              setState(() {
                fontSize += 2;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: buildSmartContent(widget.content),
      ),
    );
  }

  /// 🔥 MAIN PARSER (grid + bold + normal)
  Widget buildSmartContent(String content) {
    final lines = content.split('\n');

    List<Widget> widgets = [];

    bool isGrid = false;
    int gridColumns = 0;
    List<String> gridItems = [];

    for (var line in lines) {
      final clean = line.trim();

      /// 🔥 GRID2 START
      if (clean == "[grid2]") {
        isGrid = true;
        gridColumns = 2;
        gridItems = [];
        continue;
      }

      /// 🔥 GRID3 START
      if (clean == "[grid3]") {
        isGrid = true;
        gridColumns = 3;
        gridItems = [];
        continue;
      }

      /// 🔥 GRID END
      if (clean == "[/grid2]" || clean == "[/grid3]") {
        isGrid = false;
        widgets.add(buildGrid(gridItems, gridColumns));
        continue;
      }

      /// 🔥 COLLECT GRID ITEMS
      if (isGrid) {
        if (clean.isNotEmpty) {
          gridItems.add(clean);
        }
        continue;
      }

      /// 🔥 FULL LINE BOLD (HEADING STYLE)
      if (clean.startsWith("[b]") && clean.endsWith("[/b]")) {
        final text = clean.replaceAll("[b]", "").replaceAll("[/b]", "");

        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              style: GoogleFonts.playfairDisplay(
                fontSize: fontSize + 1,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        );
        continue;
      }

      /// 🔥 NORMAL TEXT WITH INLINE BOLD
      widgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: buildRichText(line),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  /// 🔥 GRID BUILDER
  Widget buildGrid(List<String> items, int columns) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          mainAxisSpacing: 12,
          crossAxisSpacing: 20,
          childAspectRatio: columns == 2 ? 4 : 3,
        ),
        itemBuilder: (context, index) {
          return buildRichText(items[index]);
        },
      ),
    );
  }

  /// 🔥 INLINE BOLD SYSTEM
  Widget buildRichText(String text) {
    final spans = <TextSpan>[];

    final regex = RegExp(r'\[b\](.*?)\[/b\]');
    int start = 0;

    for (final match in regex.allMatches(text)) {
      /// normal text
      if (match.start > start) {
        spans.add(
          TextSpan(
            text: text.substring(start, match.start),
            style: GoogleFonts.lora(
              fontSize: fontSize,
              color: Colors.black,
            ),
          ),
        );
      }

      /// bold text
      spans.add(
        TextSpan(
          text: match.group(1),
          style: GoogleFonts.lora(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      );

      start = match.end;
    }

    /// remaining text
    if (start < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(start),
          style: GoogleFonts.lora(
            fontSize: fontSize,
            color: Colors.black,
          ),
        ),
      );
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}
