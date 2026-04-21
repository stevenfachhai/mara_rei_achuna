import 'package:flutter/material.dart';

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
  double fontSize = 16;

  /// 🔥 FONT SIZE CHANGE
  void changeFont(String size) {
    setState(() {
      if (size == "small") fontSize = 14;
      if (size == "medium") fontSize = 16;
      if (size == "large") fontSize = 18;
      if (size == "xlarge") fontSize = 20;
    });
  }

  /// 🔥 BUILD LYRICS (FINAL FIXED VERSION)
  List<Widget> buildLyrics() {
    final lines = widget.content.split('\n');

    List<Widget> widgets = [];
    bool isCenter = false;

    for (var line in lines) {
      String cleanLine = line.trim();

      /// 🔥 DETECT START CENTER (STRONG CHECK)
      if (cleanLine.toLowerCase().contains("[center]")) {
        isCenter = true;
        continue;
      }

      /// 🔥 DETECT END CENTER
      if (cleanLine.toLowerCase().contains("[/center]")) {
        isCenter = false;
        continue;
      }

      /// 🔥 SKIP EMPTY LINES (optional clean)
      if (cleanLine.isEmpty) {
        widgets.add(const SizedBox(height: 8));
        continue;
      }

      widgets.add(
        Padding(
          padding: isCenter
              ? const EdgeInsets.symmetric(vertical: 4, horizontal: 40)
              : const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            cleanLine,
            textAlign: isCenter ? TextAlign.justify : TextAlign.left,
            style: TextStyle(
              fontSize: fontSize,
              height: 1.6,
              fontWeight: isCenter ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),

        /// 🔥 FONT SIZE MENU
        actions: [
          PopupMenuButton<String>(
            onSelected: changeFont,
            itemBuilder: (context) => const [
              PopupMenuItem(value: "small", child: Text("Small")),
              PopupMenuItem(value: "medium", child: Text("Medium")),
              PopupMenuItem(value: "large", child: Text("Large")),
              PopupMenuItem(value: "xlarge", child: Text("Extra Large")),
            ],
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔥 TITLE
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            /// 🔥 LYRICS
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: buildLyrics(),
                ),
              ),
            ),
          ],
        ),
      ),

      /// 🔥 HOME BUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popUntil(context, (route) => route.isFirst);
        },
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
    );
  }
}
