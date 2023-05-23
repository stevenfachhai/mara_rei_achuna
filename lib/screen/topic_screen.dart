import 'package:flutter/material.dart';
import 'package:mara_rei_achuna/screen/chapter_screen.dart';
import 'package:mara_rei_achuna/screen/story_screen.dart';
import 'package:mara_rei_achuna/content/topic_list.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: topicList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    topicList[index],
                    style: const TextStyle(fontSize: 17),
                  ),
                  onTap: () {
                    if (index == 7) {
                      // Check if index is 8
                      print(index + 1); // Print index for StoryScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoryScreen(
                            storyNumber: index + 1,
                          ),
                        ),
                      );
                    } else {
                      print(index + 1); // Print index for ChapterScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChapterScreen(
                            titleNumber: index + 1,
                          ),
                        ),
                      );
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
