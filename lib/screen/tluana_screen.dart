import 'package:flutter/material.dart';
import 'package:mara_rei_achuna/screen/title_screen.dart';
import 'package:mara_rei_achuna/screen/topic_screen.dart';
import 'package:mara_rei_achuna/story/tluana_list.dart';
import 'package:mara_rei_achuna/screen/story_screen.dart';

import 'home_screen.dart';

class TluanaScreen extends StatelessWidget {
  const TluanaScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: tluanaList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    tluanaList[index],
                    style: const TextStyle(fontSize: 17),
                  ),
                  onTap: () {
                    // ignore: avoid_print
                    print(index + 1); // Print index for ChapterScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoryScreen(
                          titleNumber: index + 1,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 50.0,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TitleScreen(),
                  ),
                );
              },
              child: Image.asset(
                'assets/image/PHOHLA2.png', // Replace with the path of your first image
                width: 80,
                height: 80,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              backgroundColor: Colors.black,
              child: Image.asset(
                'assets/image/HOME1.png', // Replace with the path of your second image
                width: 80,
                height: 80,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TopicScreen(),
                  ),
                );
              },
              child: Image.asset(
                'assets/image/ACHUAWPAZY.png', // Replace with the path of your second image
                width: 80,
                height: 80,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
    );
  }
}
