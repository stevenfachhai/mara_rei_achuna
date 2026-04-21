import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mara_rei_achuna1/screen/theme_provider.dart';
import 'package:provider/provider.dart';

import 'package:mara_rei_achuna1/screen/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB-c5mavpL3LlfdGg67g51MtSKTM5_gVOg",
        authDomain: "adminpanel-82819.firebaseapp.com",
        projectId: "adminpanel-82819",
        storageBucket: "adminpanel-82819.firebasestorage.app",
        messagingSenderId: "386151344884",
        appId: "1:386151344884:web:8c157aa6f4495fe5c44ca1",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /// 🔥 THEME CONTROL
      themeMode: themeProvider.themeMode,

      theme: ThemeData.light(),

      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
      ),

      home: const HomeScreen(),
    );
  }
}
