import 'package:flutter/material.dart';
import 'package:mara_rei_achuna/content/title_list.dart';

class BlockScreen extends StatelessWidget {
  BlockScreen({
    Key? key,
    required this.titleNumber,
  }) : super(key: key);

  final int titleNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 35),
          child: const Text(
            'hello',
            style: TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}
