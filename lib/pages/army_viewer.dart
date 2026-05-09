import 'package:warhammer/global_imports.dart';

class ArmyViewer extends StatelessWidget {
  final String spearheadName;
  final String enhancementPick;
  final String regimentPick;
  const ArmyViewer(this.spearheadName, this.enhancementPick, this.regimentPick, {super.key});
  
  @override
  Widget build(BuildContext context) {
    //Pre-UI logic
    final db = Provider.of<WarhammerDatabase>(context, listen: false);
    // final spearheadData = <USE spearheadName,enhancementPick, regimentPick TO BUILD OUT ALL DATA NEEDED TO QUERY AND GET DATA NEEDED AND STORED>

    //return the UI
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.maybePop(context), icon: Icon((Icons.arrow_back_ios_new))),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [      
          Text("Yay! almost done!"),
          Text("Spearhead Pick: $spearheadName"),
          Text("Enhancement Pick: $enhancementPick"),
          Text("Regiment Pick: $regimentPick"),
          ],
      ),
      

    );
  }
}