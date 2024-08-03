import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mara_rei_achuna1/service_locator.dart';
import 'package:mara_rei_achuna1/word_list_screen/word_list_manager.dart';

class WordListScreen extends StatefulWidget {
  const WordListScreen({
    Key? key,
    required this.prefix,
    required this.alphabet,
  }) : super(key: key);

  final String prefix;
  final String alphabet;

  @override
  State<WordListScreen> createState() => _WordListScreenState();
}

class _WordListScreenState extends State<WordListScreen> {
  final manager = getIt<WordListScreenManager>();
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    manager.lookUpWordsWith(widget.prefix);
  }

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  Widget _buildAlphabetTiles(String alphabet) {
    final lines =
        alphabet.split('\n').where((line) => line.trim().isNotEmpty).toList();
    List<Widget> tiles = [];
    for (var line in lines) {
      if (line.contains('(') && line.contains(')')) continue; // Skip headers
      final letters = line.trim().split(RegExp(r'\s+'));
      tiles.addAll(letters.map((letter) {
        return GestureDetector(
          onTap: () => _speak(letter),
          child: Chip(
            label: Text(letter),
            backgroundColor: Colors.blueAccent,
            labelStyle: TextStyle(color: Colors.white),
          ),
        );
      }));
    }
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: tiles,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: _buildAlphabetTiles(widget.alphabet),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<String>>(
              valueListenable: manager.wordListNotifier,
              builder: (context, wordList, child) {
                return ListView.builder(
                  itemCount: wordList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(wordList[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

const maraReihChahnawhalphabet = '''
HAWRAWH PIPA (CAPITAL LETTERS)
A AW Y B CH D 
E F H I K L 
M N NG O Ô P 
R S T U V Z 

Hawrawh chypa (small letters)
a aw y b ch d 
e f h i k l 
m n ng o ô p 
r s t u v z 
''';

void main() {
  runApp(
    MaterialApp(
      home: WordListScreen(
        prefix: 'somePrefix',
        alphabet: maraReihChahnawhalphabet,
      ),
    ),
  );
}
