import 'package:flutter/material.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key, required int storyNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story'),
      ),
      body: Container(
        child: Image.asset('assets/image/nubyh.png'),
      ),
    );
  }
}
