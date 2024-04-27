import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:university/firebase_options.dart';
import 'package:university/src/core/ui/components/BottomNavBar.dart';


Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
