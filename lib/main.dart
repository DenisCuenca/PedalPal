import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './services/auth/widget_tree.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBYRkuf_N_93H8x2ev3tp5enB6udShYrdQ",
          appId: "1:796529585211:android:f9e72fdef6517ecebec01e",
          messagingSenderId: "796529585211",
          projectId: "pedalpal-2847b"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const c = Color(0x00007e80);
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.blue, elevation: 0),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0x004853),
          brightness: Brightness.light,
        ).copyWith(background: Colors.white),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const WidgetTree(),
    );
  }
}
