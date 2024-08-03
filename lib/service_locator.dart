import 'package:get_it/get_it.dart';
import 'package:mara_rei_achuna1/data/word_repository.dart';
import 'package:mara_rei_achuna1/word_list_screen/word_list_manager.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<WordListScreenManager>(
      () => WordListScreenManager());
  getIt.registerLazySingleton<WordRepository>(() => FakeDatabase());
}
