import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mara_rei_achuna1/content/topic_list.dart';
import 'package:mara_rei_achuna1/screen/chapter_screen.dart';
import 'package:mara_rei_achuna1/screen/home_screen.dart';
import 'package:mara_rei_achuna1/screen/title_screen.dart';
import 'package:mara_rei_achuna1/screen/tluana_screen.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({
    Key? key,
  }) : super(key: key);

  @override
  _TopicScreenState createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const TitleScreen(),
    const HomeScreen(),
    const TluanaScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      default:
        break;
    }
  }

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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 8,
              activeColor: Color.fromARGB(255, 17, 17, 17),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              tabs: [
                GButton(
                  icon: Icons.music_note,
                  text: 'Mara pho hla',
                  textStyle: TextStyle(
                    fontSize: 14, // Adjust the font size as needed
                    color: Colors.black, // Adjust the text color as needed
                  ),
                  iconActiveColor:
                      Colors.black, // Adjust the icon color as needed
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TitleScreen(),
                      ),
                    );
                  },
                ),
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  textStyle: TextStyle(
                    fontSize: 14, // Adjust the font size as needed
                    color: Colors.black, // Adjust the text color as needed
                  ),
                  iconActiveColor:
                      Colors.black, // Adjust the icon color as needed
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),
                GButton(
                  icon: Icons.edit_note,
                  text: 'Mara phôhpa',
                  textStyle: TextStyle(
                    fontSize: 14, // Adjust the font size as needed
                    color: Colors.black, // Adjust the text color as needed
                  ),
                  iconActiveColor:
                      Colors.black, // Adjust the icon color as needed
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TluanaScreen(),
                      ),
                    );
                  },
                ),
              ],
              selectedIndex: _currentIndex,
              onTabChange: _onTabTapped, // Use the custom callback
            ),
          ),
        ),
      ),
    );
  }
}
