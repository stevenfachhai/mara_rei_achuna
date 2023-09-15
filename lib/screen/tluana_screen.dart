import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mara_rei_achuna1/screen/title_screen.dart';
import 'package:mara_rei_achuna1/screen/topic_screen.dart';
import 'package:mara_rei_achuna1/story/tluana_list.dart';
import 'package:mara_rei_achuna1/screen/story_screen.dart';

import 'home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TluanaScreen extends StatelessWidget {
  const TluanaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

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
      body: ListView.builder(
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: GNav(
          tabs: const [
            GButton(
              icon: Icons.music_note,
              text: 'Mara Pho hla',
            ),
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.library_books_outlined,
              text: 'Achu awpa zy',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            // Handle tab changes here
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TitleScreen(),
                  ),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TopicScreen(),
                  ),
                );
                break;
            }
          },
        ),
      ),
    );
  }
}
