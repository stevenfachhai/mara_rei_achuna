import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleScreen extends StatefulWidget {
  final String title;
  final String content;
  final String author;

  const ArticleScreen({
    super.key,
    required this.title,
    required this.content,
    required this.author,
  });

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  double fontSize = 17;

  int likeCount = 0;
  bool isLiked = false;

  void toggleLike() {
    setState(() {
      if (isLiked) {
        isLiked = false;
        likeCount = 0;
      } else {
        isLiked = true;
        likeCount = 1;
      }
    });
  }

  void changeFont(String size) {
    setState(() {
      if (size == "small") fontSize = 15;
      if (size == "medium") fontSize = 17;
      if (size == "large") fontSize = 19;
      if (size == "xlarge") fontSize = 21;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 18),
            Text(
              widget.title,
              style: GoogleFonts.libreBaskerville(
                textStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "By ${widget.author}",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.content,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.libreBaskerville(
                        textStyle: TextStyle(
                          fontSize: fontSize,
                          height: 1.6,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// 👍 FACEBOOK LIKE
                    GestureDetector(
                      onTap: toggleLike,
                      child: Row(
                        children: [
                          Icon(
                            Icons.thumb_up,
                            size: 20,
                            color: isLiked ? Colors.blue : Colors.grey,
                          ),
                          if (likeCount > 0)
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                likeCount >= 1000
                                    ? '${(likeCount / 1000).toStringAsFixed(1)}K'
                                    : '$likeCount',
                                style: TextStyle(
                                  color: isLiked ? Colors.blue : Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
