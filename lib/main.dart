import 'package:warhammer/global_imports.dart';
import 'package:warhammer/pages/landing_page.dart';
import 'package:warhammer/programming_utils/dartDB/compiledSpearhead.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final spearheads = WarhammerDatabase();
  List<ActiveSpearhead> savedConfigurations = [];
  //final isVsMode = false; TODO: add VSMode
  runApp(
    MultiProvider(
      providers: [
        Provider<WarhammerDatabase>.value(value: spearheads),
        Provider<List<ActiveSpearhead>>.value(value: savedConfigurations)
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

