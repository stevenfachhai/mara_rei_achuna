import 'package:flutter/material.dart';

class HistoryDetailScreen extends StatefulWidget {
  final String title;
  final String content;

  const HistoryDetailScreen({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  State<HistoryDetailScreen> createState() => _HistoryDetailScreenState();
}

class _HistoryDetailScreenState extends State<HistoryDetailScreen> {
  double fontSize = 16;

  void changeFont(String size) {
    setState(() {
      if (size == "small") fontSize = 14;
      if (size == "medium") fontSize = 18;
      if (size == "large") fontSize = 20;
      if (size == "xlarge") fontSize = 23;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),

        /// 🔥 MENU (LIKE YOUR IMAGE)
        actions: [
          PopupMenuButton<String>(
            onSelected: changeFont,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: "small",
                child: Text("Small"),
              ),
              const PopupMenuItem(
                value: "medium",
                child: Text("Medium"),
              ),
              const PopupMenuItem(
                value: "large",
                child: Text("Large"),
              ),
              const PopupMenuItem(
                value: "xlarge",
                child: Text("Extra Large"),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TITLE
            Text(
              widget.title.toUpperCase(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            /// CONTENT
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  widget.content,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: fontSize, // 🔥 dynamic
                    height: 1.6,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
