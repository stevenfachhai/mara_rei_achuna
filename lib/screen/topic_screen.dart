import 'package:flutter/material.dart';
import 'package:mara_rei_achuna/screen/block_screen.dart';
import 'package:mara_rei_achuna/content/title_list.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({
    Key? key,
    required this.titleList,
  }) : super(key: key);

  final List<String> titleList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: titleList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                titleList[index],
                style: TextStyle(fontSize: 17),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlockScreen(
                      titleNumber: index + 1,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
