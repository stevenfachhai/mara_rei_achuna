import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'alphabet_screen.dart';
import 'chapter_screen.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("Achu awpa zy"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('content')
            .where('type', isEqualTo: 'Topic')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            children: [
              /// 🔤 Alphabet (FIRST)
              _articleTile(
                context,
                index: 1,
                title: "Mara reih châhnawh (Alphabet)",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AlphabetScreen(),
                    ),
                  );
                },
              ),

              /// 📚 Topics
              ...docs
                  .where((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    return data['title'] != null && data['title'] != '';
                  })
                  .toList()
                  .asMap()
                  .entries
                  .map((entry) {
                    final i = entry.key;
                    final data = entry.value.data() as Map<String, dynamic>;

                    final title = data['title'] ?? '';
                    final content = data['content'] ?? '';

                    return _articleTile(
                      context,
                      index: i + 2,
                      title: title,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChapterScreen(
                              title: title,
                              content: content,
                              audio: '', // ❌ removed audio
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ],
          );
        },
      ),
    );
  }

  /// 🔥 ARTICLE STYLE TILE (CLEAN)
  Widget _articleTile(
    BuildContext context, {
    required int index,
    required String title,
    required VoidCallback onTap,
  }) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
            child: Row(
              children: [
                /// 🔢 NUMBER
                Text(
                  "$index.",
                  style: TextStyle(
                    fontSize: 15,
                    color: textColor?.withOpacity(0.7),
                  ),
                ),

                const SizedBox(width: 10),

                /// 📖 TITLE
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                ),

                /// ➡️ ARROW
                Icon(
                  Icons.chevron_right,
                  color: textColor?.withOpacity(0.6),
                ),
              ],
            ),
          ),
        ),

        /// 🔥 DIVIDER (IMPORTANT FOR ARTICLE STYLE)
        Divider(
          height: 1,
          color: Theme.of(context).dividerColor.withOpacity(0.3),
        ),
      ],
    );
  }
}
