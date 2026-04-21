import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'story_screen.dart';

class StoryListScreen extends StatelessWidget {
  const StoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stories"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('content')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          /// 🔥 LOADING
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          /// 🔥 ERROR
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text("No data"));
          }

          final allDocs = snapshot.data!.docs;

          /// 🔥 FILTER STORY (IMPORTANT FIX)
          final docs = allDocs.where((doc) {
            final data = doc.data() as Map<String, dynamic>;
            final type = (data['type'] ?? '').toString().toLowerCase();

            return type == 'story' || type == 'stories';
          }).toList();

          /// 🔥 EMPTY
          if (docs.isEmpty) {
            return const Center(child: Text("No stories found"));
          }

          /// 🔥 LIST
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              final data = doc.data() as Map<String, dynamic>;

              final title = data['title'] ?? '';
              final content = data['content'] ?? '';
              final author = data['author'] ?? 'Admin';

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Theme.of(context).cardColor // dark mode
                      : Colors.grey.shade200, // light mode
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,

                  title: Text(
                    "${index + 1}. $title",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),

                  subtitle: Text("By $author"),

                  trailing: const Icon(Icons.chevron_right),

                  /// 🔥 NAVIGATION
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => StoryScreen(
                          title: title,
                          content: content,
                          author: author,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
