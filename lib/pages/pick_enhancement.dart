import 'package:warhammer/global_imports.dart';
import 'package:warhammer/pages/pick_regiment.dart';

class PickEnhancement extends StatelessWidget {
  final String spearheadName;
  const PickEnhancement(this.spearheadName, {super.key});

  @override
  Widget build(BuildContext context) 
  {
    //Pre-logic
    final db = Provider.of<WarhammerDatabase>(context, listen: false);
    
    //Build out the UI
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PickRegiment.titleText(context, 'assets/images/missingTexture.PNG', "Pick Army Enhancement"),
              PickRegiment.getSpearheadAbilityData(
                context,
                db.getEnhancements(spearheadName).watch(),
                (ability) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PickRegiment(spearheadName, ability.id),
                  ),
                ),
              ),
            ], //children
          ),
        ),
      ),
    );
  }



}
