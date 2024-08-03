import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mara_rei_achuna1/screen/donation_screen.dart';
import 'package:mara_rei_achuna1/screen/title_screen.dart';
import 'package:mara_rei_achuna1/screen/tluana_screen.dart';
import 'package:mara_rei_achuna1/screen/topic_screen.dart';
import 'package:mara_rei_achuna1/screen/article_screen.dart'; // Import the article screen

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/update.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 434),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TopicScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                          color: const Color.fromARGB(255, 250, 247, 247),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/image/icon.png',
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Achu awpa zy',
                            style: GoogleFonts.libreBaskerville(
                              fontSize: 15,
                              color: Color.fromARGB(255, 236, 161, 90),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TitleScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                          color: const Color.fromARGB(255, 242, 241, 241),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/image/PHOHLA2.png',
                            width: 35,
                            height: 35,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '  Pho Hla   ',
                            style: GoogleFonts.libreBaskerville(
                              fontSize: 15,
                              color: Color.fromARGB(255, 236, 161, 90),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TluanaScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 8, 8, 8),
                        border: Border.all(
                          color: Color.fromARGB(255, 237, 234, 234),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/image/MARAPHOPA1.png',
                            width: 35,
                            height: 35,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '  Phôhpa   ',
                            style: GoogleFonts.libreBaskerville(
                              fontSize: 15,
                              color: Color.fromARGB(255, 236, 161, 90),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleScreen(
                            title: 'Sample Article',
                            author: 'John Doe',
                            publicationDate: 'July 8, 2024',
                            content: 'This is a sample article content.',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 8, 8, 8),
                        border: Border.all(
                          color: Color.fromARGB(255, 237, 234, 234),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/image/ARTICLE.png',
                            width: 35,
                            height: 35,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '    Article   ',
                            style: GoogleFonts.libreBaskerville(
                              fontSize: 15,
                              color: Color.fromARGB(255, 236, 161, 90),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TluanaScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 8, 8, 8),
                        border: Border.all(
                          color: Color.fromARGB(255, 237, 234, 234),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/image/POEM.png',
                            width: 35,
                            height: 35,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '    Hlaphô   ',
                            style: GoogleFonts.libreBaskerville(
                              fontSize: 15,
                              color: Color.fromARGB(255, 236, 161, 90),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              Positioned(
                bottom: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DonationScreen(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.currency_rupee,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
