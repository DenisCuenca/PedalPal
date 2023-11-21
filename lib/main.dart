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
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WidgetTree(),
    );
  }
}
