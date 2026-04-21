import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GeneralQAScreen extends StatelessWidget {
  const GeneralQAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("General Knowledge"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('content').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No data"));
          }

          // filter General only
          final docs =
              snapshot.data!.docs.where((e) => e['type'] == 'General').toList();

          if (docs.isEmpty) {
            return const Center(child: Text("No General Knowledge"));
          }

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Q${index + 1}. ${data['question']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Ans: ${data['answer']}",
                      style: const TextStyle(fontSize: 15),
                    ),
                    const Divider(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
