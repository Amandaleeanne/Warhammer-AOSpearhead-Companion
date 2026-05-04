import 'package:flutter/material.dart';
import 'package:warhammer/assets/dartDB/spearhead_database.dart';
import 'package:warhammer/pages/landing_page.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/';
// import 'package:flutter/foundation.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final spearheads = WarhammerDatabase();
  runApp(MainApp(db: spearheads));
}

class MainApp extends StatelessWidget {
  final WarhammerDatabase db;
  const MainApp({super.key, required this.db});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LandingPage(db : db));
  }
}
