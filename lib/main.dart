import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pedalpal/pages/history/my_bicicles.dart';
import 'package:pedalpal/pages/home_page.dart';
import 'package:pedalpal/pages/splash.dart';
import './services/auth/widget_tree.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAScF7K5L6rskqbN2JVXHh5WsQbfQ7pkx4",
          appId: "1:24383345107:android:51019411b499444a949f26",
          messagingSenderId: "24383345107",
          projectId: "pedalpal-77503"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "home": (context) => HomePage(),
        "history": (context) => MyBikes(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.mohaveTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        bottomAppBarTheme:
            const BottomAppBarTheme(color: Colors.blue, elevation: 0),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0x004853),
          brightness: Brightness.light,
        ).copyWith(background: Colors.white),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
