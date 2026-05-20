import "package:warhammer/global_imports.dart";
import "package:warhammer/pages/army_viewer.dart";

class PickRegiment extends StatelessWidget {
  //----- Variuble and constructor initalization -----
  final String spearheadName;
  final int enhancementPick;
  const PickRegiment(this.spearheadName, this.enhancementPick, {super.key}); 

// ---- Start UI work -------
  @override
  Widget build(BuildContext context) {
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
              titleText(context, "assets/images/missingTexture.PNG", "Pick Regiment ability"),
              PickRegiment.getSpearheadAbilityData(
                context,
                db.getRegimentAbility(spearheadName).watch(),
                (ability) => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArmyViewer(spearheadName, enhancementPick, ability.id),
                  ),
                  (route) => (route.settings.name == 'LandingPage' || route.isFirst) ? true : false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//----------------- Used and Exported Styling Elements (see pick_enhancement)----------------
///The text at the top of the bar on both the Army Enhancement screen and the Pick regement ability screen. "Exported" by PickRegiment
  static Expanded titleText(BuildContext context, String imagePath, String text) => Expanded(
        child: Column(
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonUtils.customBackButton(context),
                Expanded(child: Text(text, textAlign: TextAlign.center, style: const TextStyle(fontSize: 22.0))),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CommonUtils.roundedImage(width: 35, height: 35, imagePath: imagePath),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      );


  static Expanded getSpearheadAbilityData(BuildContext context, Stream<List<Ability>> abilityStream, void Function(Ability ability) onTap,) 
  => Expanded(
        flex: 3,
        child: StreamBuilder<List<Ability>>(
          stream: abilityStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const CircularProgressIndicator();

            final abilities = snapshot.data!;

            return ListView(
              children: abilities.map((ability) {
                return CommonUtils.abilityCardNavigator(
                  context: context,
                  usage: ability.type.capitalize(),
                  title: ability.name.capitalize(),
                  description: ability.description,
                  onTap: () => onTap(ability),
                );
              }).toList(),
            );
          },
        ),
      );
}
