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
  Duration _audioDuration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    initializeAudio();
  }

  Future<void> initializeAudio() async {
    await _audioPlayer.setAsset(audioBlock[widget.titleNumber] ?? '');

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

    _audioPlayer.playerStateStream.listen((playerState) {
      setState(() {
        _isPlaying = playerState.playing;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }
  }

  Future<void> stopAudio() async {
    await _audioPlayer.stop();
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final block = chapterBlock[widget.titleNumber] ?? '';
    final audio = audioBlock[widget.titleNumber] ?? '';

    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  Text(
                    block,
                    style: const TextStyle(fontSize: 17),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          _isPlaying ? Icons.pause : Icons.play_arrow,
                        ),
                        onPressed: playAudio,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.stop,
                        ),
                        onPressed: stopAudio,
                      ),
                      Expanded(
                        child: Slider(
                          value: _position.inSeconds.toDouble(),
                          min: 0,
                          max: _audioDuration.inSeconds.toDouble(),
                          onChanged: (value) {
                            final newPosition =
                                Duration(seconds: value.toInt());
                            _audioPlayer.seek(newPosition);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        formatDuration(_position),
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        formatDuration(_audioDuration),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
