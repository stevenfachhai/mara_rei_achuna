import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AlphabetScreen extends StatefulWidget {
  const AlphabetScreen({super.key});

  @override
  State<AlphabetScreen> createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends State<AlphabetScreen> {
  final AudioPlayer player = AudioPlayer();

  /// 🔥 LETTER LIST (MUST MATCH MAP)
  final List<String> letters = [
    "Aa",
    "AW aw",
    "Y y",
    "B b",
    "CH ch",
    "D d",
    "E e",
    "F f",
    "H h",
    "I i",
    "K k",
    "L l",
    "M m",
    "N n",
    "NG ng",
    "O o",
    "Ô ô",
    "P p",
    "R r",
    "S s",
    "T t",
    "U u",
    "V v",
    "Z z",
  ];

  /// 🔥 PLAY FUNCTION (FIXED)
  Future<void> playLetter(String text) async {
    print("Clicked: [$text]"); // DEBUG

    final map = {
      "Aa": "A",
      "AW aw": "AW",
      "Y y": "Y",
      "B b": "B",
      "CH ch": "CH",
      "D d": "D",
      "E e": "E",
      "F f": "F",
      "H h": "H",
      "I i": "I",
      "K k": "K",
      "L l": "L",
      "M m": "M",
      "N n": "N",
      "NG ng": "NG",
      "O o": "O",
      "Ô ô": "Ô", // IMPORTANT
      "P p": "P",
      "R r": "R",
      "S s": "S",
      "T t": "T",
      "U u": "U",
      "V v": "V",
      "Z z": "Z",
    };

    final file = map[text];

    print("Mapped file: $file"); // DEBUG

    if (file == null) {
      print("❌ No match found!");
      return;
    }

    try {
      await player.stop(); // 🔥 VERY IMPORTANT
      await player.setAsset("assets/audio/$file.mp3");
      await player.play();
    } catch (e) {
      print("ERROR: $e");
    }
  }

  /// 🔥 UI BOX
  Widget letterBox(String text) {
    return GestureDetector(
      onTap: () => playLetter(text),
      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blueAccent, width: 2),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  /// 🔥 UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alphabet')),
      body: Center(
        child: SizedBox(
          width: 400,
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: letters.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return letterBox(letters[index]);
            },
          ),
        ),
      ),
    );
  }
}
