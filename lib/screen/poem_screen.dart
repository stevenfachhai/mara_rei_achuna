import 'package:flutter/material.dart';

class PoemScreen extends StatefulWidget {
  final String title;
  final String content;
  final String author;

  const PoemScreen({
    super.key,
    required this.title,
    required this.content,
    required this.author,
  });

  @override
  State<PoemScreen> createState() => _PoemScreenState();
}

class _PoemScreenState extends State<PoemScreen> {
  double fontSize = 16;

  int likeCount = 0;
  bool isLiked = false;

  /// 🔥 FACEBOOK STYLE TOGGLE
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            /// 🔙 BACK BUTTON
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            /// 🔤 FONT SIZE BUTTON
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.text_fields),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() => fontSize = 14);
                                Navigator.pop(context);
                              },
                              child: const Text("A-"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() => fontSize = 20);
                                Navigator.pop(context);
                              },
                              child: const Text("A"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() => fontSize = 24);
                                Navigator.pop(context);
                              },
                              child: const Text("A+"),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            /// 📜 MAIN CONTENT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const Spacer(),

                        /// 🟡 POEM
                        Column(
                          children: [
                            /// TITLE
                            Text(
                              widget.title.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: fontSize + 6,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 20),

                            /// CONTENT
                            Text(
                              widget.content.replaceAll("\\n", "\n"),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: fontSize,
                                height: 1.8,
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        /// ✍ AUTHOR
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "— ${widget.author}",
                            style: TextStyle(
                              fontSize: fontSize - 2,
                              fontStyle: FontStyle.italic,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.color
                                  ?.withOpacity(0.7),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        /// 🔥 FACEBOOK STYLE LIKE
                        GestureDetector(
                          onTap: toggleLike,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.thumb_up,
                                size: 20,
                                color: isLiked ? Colors.blue : Colors.grey,
                              ),

                              /// SHOW COUNT ONLY WHEN LIKED
                              if (likeCount > 0)
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Text(
                                    likeCount >= 1000
                                        ? '${(likeCount / 1000).toStringAsFixed(1)}K'
                                        : '$likeCount',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          isLiked ? Colors.blue : Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
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
