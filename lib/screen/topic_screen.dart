import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mara_rei_achuna1/screen/chapter_screen.dart';
import 'package:mara_rei_achuna1/content/topic_list.dart';
import 'package:mara_rei_achuna1/screen/home_screen.dart';
import 'package:mara_rei_achuna1/screen/title_screen.dart';
import 'package:mara_rei_achuna1/screen/tluana_screen.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Achu awpa zy',
          style: GoogleFonts.yesevaOne(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 19, 18, 18),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: topicList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    topicList[index],
                    style: GoogleFonts.arapey(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () {
                    print(index + 1);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChapterScreen(
                          titleNumber: index + 1,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 50.0,
        color: Color.fromARGB(255, 5, 5, 5),
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
                backgroundColor: Color.fromARGB(255, 15, 15, 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.music_note,
                    color: Color.fromARGB(255, 252, 249, 249),
                    size: 20,
                  ),
                  Text(
                    'Mara pho hla',
                    style: TextStyle(
                      fontSize: 5,
                      color: Color.fromARGB(255, 250, 249, 249),
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
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home, color: Colors.white),
                  SizedBox(height: 4),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 5,
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
                    builder: (context) => const TluanaScreen(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.edit_note, color: Colors.white),
                  SizedBox(height: 4),
                  Text(
                    'Mara phôhpa',
                    style: TextStyle(
                      fontSize: 5,
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
