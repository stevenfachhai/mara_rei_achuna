import 'package:flutter/material.dart';
import 'package:mara_rei_achuna1/data/word_repository.dart';
import 'package:mara_rei_achuna1/service_locator.dart';

class WordListScreenManager {
  final wordListNotifier = ValueNotifier<List<String>>([]);

  void lookUpWordsWith(String prefix) async {
    final wordRepository = getIt<WordRepository>();
    wordListNotifier.value = await wordRepository.wordsBigginingWith(prefix);
  }
}
