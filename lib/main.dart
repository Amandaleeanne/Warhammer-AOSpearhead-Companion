import 'package:warhammer/global_imports.dart';
import 'package:warhammer/pages/landing_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final spearheads = WarhammerDatabase();
  final isVsMode = false;
  runApp(
    MultiProvider(
      providers: [
        Provider<WarhammerDatabase>.value(value: spearheads),
      ],
      child: const MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

