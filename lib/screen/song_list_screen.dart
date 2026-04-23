import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'phohla_screen.dart';

class SongListScreen extends StatefulWidget {
  final String category;

  const SongListScreen({super.key, required this.category});

  @override
  State<SongListScreen> createState() => _SongListScreenState();
}

class _SongListScreenState extends State<SongListScreen> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.category, // ✅ FIXED
          style: GoogleFonts.playfairDisplay(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isDark
                ? Colors.white
                : const Color.fromARGB(255, 245, 243, 243),
          ),
        ),
      ),
      body: Column(
        children: [
          /// 🔍 SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              style: const TextStyle(color: Colors.black), // text color
              decoration: InputDecoration(
                hintText: "Search song...",
                hintStyle: const TextStyle(color: Colors.grey),

                suffixIcon: const Icon(Icons.search, color: Colors.black),

                filled: true,
                fillColor: Colors.grey.shade300, // always same

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
                  .collection('songs')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final allDocs = snapshot.data!.docs;

                /// 🔥 FILTER CATEGORY + SEARCH
                final docs = allDocs.where((doc) {
                  final data = doc.data() as Map<String, dynamic>;

                  final title = (data['title'] ?? '').toString().toLowerCase();
                  final category =
                      (data['category'] ?? '').toString().toLowerCase();

                  return category == widget.category.toLowerCase() &&
                      title.contains(searchText);
                }).toList();

                if (docs.isEmpty) {
                  return const Center(child: Text("No songs found"));
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;

                    final title = data['title'] ?? '';
                    final content = data['content'] ?? '';

                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        title: Text(
                          "${index + 1}. $title",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? Colors.white
                                : const Color.fromARGB(255, 245, 243, 243),
                          ),
                        ),
                        trailing: const Icon(Icons.chevron_right,
                            color: Colors.white),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PhohlaScreen(
                                title: title,
                                content: content,
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
