import 'package:flutter/material.dart';
import 'package:marfah_tech/providers/note_provider.dart';
import 'package:marfah_tech/screens/add_note_screen.dart';
import 'package:marfah_tech/screens/home_screen.dart';
import 'package:marfah_tech/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final noteProvider = NoteProvider();
  await noteProvider.loadNotes();
  runApp(ChangeNotifierProvider.value(value: noteProvider, child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF1976D2),
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black54)),
      ),
      debugShowCheckedModeBanner: false,
      title: "Notes Keeper",
      home: SplashScreen(),
      // routes: {'/home': (context) => HomeScreen()},
    );
  }
}
