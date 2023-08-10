// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mara_rei_achuna1/screen/title_screen.dart';
import 'package:mara_rei_achuna1/screen/tluana_screen.dart';
import 'package:mara_rei_achuna1/screen/topic_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/Contentsh.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 464), // Add this SizedBox here

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
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/image/icon.png', // Replace with the path to your first image file
                          width:
                              50, // Replace with the desired width for the image
                          height:
                              50, // Replace with the desired height for the image
                        ),
                        const SizedBox(
                            width:
                                10), // Add some spacing between the first image and text
                        Text(
                          'Achu awpa zy',
                          style: GoogleFonts.libreBaskerville(
                            fontSize: 25,
                            color: Color.fromARGB(255, 236, 161, 90),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                    height: 20), // Add some spacing between the two icons

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
                          'assets/image/PHOHLA2.png', // Replace with the path to your second image file
                          width:
                              50, // Replace with the desired width for the image
                          height:
                              50, // Replace with the desired height for the image
                        ),
                        const SizedBox(
                            width:
                                10), // Add some spacing between the second image and text
                        Text(
                          '   Phohla     ',
                          style: GoogleFonts.libreBaskerville(
                            fontSize: 30,
                            color: Color.fromARGB(255, 236, 161, 90),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                    height: 20), // Add some spacing between the two icons

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
                          'assets/image/MARAPHOPA1.png', // Replace with the path to your second image file
                          width:
                              50, // Replace with the desired width for the image
                          height:
                              50, // Replace with the desired height for the image
                        ),
                        const SizedBox(
                            width:
                                10), // Add some spacing between the second image and text
                        Text(
                          '   Phôhpa    ',
                          style: GoogleFonts.libreBaskerville(
                            fontSize: 30,
                            color: Color.fromARGB(255, 236, 161, 90),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
