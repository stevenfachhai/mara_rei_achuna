import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mara_rei_achuna1/screen/title_screen.dart';
import 'package:mara_rei_achuna1/screen/topic_screen.dart';
import 'package:mara_rei_achuna1/story/tluana_list.dart';
import 'package:mara_rei_achuna1/screen/story_screen.dart';

import 'home_screen.dart';

class TluanaScreen extends StatelessWidget {
  const TluanaScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 54, 27, 11),
        title: Text(
          'Mara Phôhpa',
          style: GoogleFonts.yesevaOne(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
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
        color: Color.fromARGB(255, 12, 12, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TitleScreen(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20), // Adjust the radius as needed
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8), // Adjust padding as needed
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.music_note, color: Colors.white),
                  SizedBox(
                      height: 4), // Add some space between the icon and text
                  Text(
                    'Mara Pho hla', // Your text here
                    style: TextStyle(
                      fontSize: 5, // Adjust the font size as needed
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20), // Adjust the radius as needed
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8), // Adjust padding as needed
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home, color: Colors.white),
                  SizedBox(
                      height: 4), // Add some space between the icon and text
                  Text(
                    'Home', // Your text here
                    style: TextStyle(
                      fontSize: 5, // Adjust the font size as needed
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TopicScreen(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20), // Adjust the radius as needed
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8), // Adjust padding as needed
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.library_books_outlined, color: Colors.white),
                  SizedBox(
                      height: 4), // Add some space between the icon and text
                  Text(
                    'Achu awpa zy', // Your text here
                    style: TextStyle(
                      fontSize: 5, // Adjust the font size as needed
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 0,
        ),
      ),
    );
  }
}
