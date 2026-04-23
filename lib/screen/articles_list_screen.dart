import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'article_screen.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({super.key});

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  String searchText = '';
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),

        /// 🔥 PREMIUM TITLE FONT
        title: Text(
          "Articles",
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          /// 🔥 ANIMATED SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: searchController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Search by author...",
                hintStyle: const TextStyle(color: Colors.grey),

                /// 🔥 ANIMATED ICON
                prefixIcon: const Icon(Icons.search, color: Colors.black),

                suffixIcon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: searchText.isEmpty
                      ? const SizedBox() // nothing when empty
                      : IconButton(
                          key: const ValueKey("clear"),
                          icon: const Icon(Icons.close, color: Colors.black),
                          onPressed: () {
                            searchController.clear();
                            setState(() {
                              searchText = '';
                            });
                          },
                        ),
                ),

                filled: true,
                fillColor: Colors.grey.shade300,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value.toLowerCase();
                });
              },
            ),
          ),

          /// 📋 LIST
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('content')
                  .where('type', isEqualTo: 'Article')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final allDocs = snapshot.data!.docs;

                /// 🔥 FILTER BY AUTHOR
                final docs = allDocs.where((doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  final author =
                      (data['author'] ?? 'admin').toString().toLowerCase();

                  return author.contains(searchText);
                }).toList();

                if (docs.isEmpty) {
                  return const Center(child: Text("No matching author"));
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;

                    final title = data['title'] ?? '';
                    final author = data['author'] ?? 'Admin';

                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Theme.of(context).cardColor
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          "${index + 1}. $title",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Text("By $author"),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ArticleScreen(
                                title: title,
                                content: data['content'] ?? '',
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
          ),
        ],
      ),
    );
  }
}
