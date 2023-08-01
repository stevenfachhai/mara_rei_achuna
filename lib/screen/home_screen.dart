import 'package:flutter/material.dart';
import 'package:mara_rei_achuna/screen/topic_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/Contentsa.png'),
            fit: BoxFit.cover,
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
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/image/icon.png', // Replace with the path to your image file
                          width:
                              50, // Replace with the desired width for the image
                          height:
                              50, // Replace with the desired height for the image
                        ),
                        const SizedBox(
                            width:
                                10), // Add some spacing between image and text
                        const Text(
                          'Achu awpa zy',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 236, 161, 90),
                            fontWeight: FontWeight.bold,
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
