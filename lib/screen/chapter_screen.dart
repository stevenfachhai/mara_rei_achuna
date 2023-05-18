// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mara_rei_achuna/content/audio_block.dart';
import 'package:mara_rei_achuna/content/chapter_block.dart';
import 'package:just_audio/just_audio.dart';

class ChapterScreen extends StatefulWidget {
  const ChapterScreen({
    Key? key,
    required this.titleNumber,
  }) : super(key: key);

  final int titleNumber;

  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  bool _isPaused = false;
  Duration _audioDuration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer.durationStream.listen((duration) {
      setState(() {
        _audioDuration = duration!;
      });
    });

    _audioPlayer.positionStream.listen((position) {
      setState(() {
        _position = position;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final block = chapterBlock[widget.titleNumber] ?? '';
    final audio = audioBlock[widget.titleNumber] ?? '';

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              Text(
                block,
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      _isPlaying || _isPaused ? Icons.pause : Icons.play_arrow,
                      size: 30,
                    ),
                    onPressed: () async {
                      if (_isPlaying) {
                        await _audioPlayer.pause();
                        setState(() {
                          _isPaused = true;
                          _isPlaying = false;
                        });
                      } else if (_isPaused) {
                        await _audioPlayer.play();
                        setState(() {
                          _isPaused = false;
                          _isPlaying = true;
                        });
                      } else {
                        await _audioPlayer.setAsset(audio);
                        await _audioPlayer.play();
                        setState(() {
                          _isPlaying = true;
                        });
                      }
                    },
                  ),
                  Text(
                    formatDuration(_position),
                    style: const TextStyle(fontSize: 16),
                  ),
                  Expanded(
                    child: Slider(
                      value: _position.inSeconds.toDouble(),
                      min: 0,
                      max: _audioDuration.inSeconds.toDouble(),
                      onChanged: (value) {
                        final newPosition = Duration(seconds: value.toInt());
                        _audioPlayer.seek(newPosition);
                      },
                    ),
                  ),
                  Text(
                    formatDuration(_audioDuration),
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
