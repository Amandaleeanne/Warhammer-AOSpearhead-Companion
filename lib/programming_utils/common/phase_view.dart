import 'package:warhammer/global_imports.dart';
import 'package:warhammer/programming_utils/common/utils.dart';
import 'package:warhammer/programming_utils/dartDB/compiledSpearhead.dart';
enum PhaseSubView { hero, move, ranged, charge, fight, endOfTurn } //Although a copy of Ability phase, it is not being reused for simplicty
extension PhaseSubViewString on PhaseSubView
{
  String get phaseTiming{
    switch(this)
    {
      case PhaseSubView.hero: return 'hero';
      case PhaseSubView.move: return 'movement';
      case PhaseSubView.ranged: return 'shooting';
      case PhaseSubView.charge: return 'charge';
      case PhaseSubView.fight: return 'combat';
      case PhaseSubView.endOfTurn: return 'end';

    }
  }
}

///Class contains everything needed to populate the PhaseView of the Main Game Page (army_viewer.dart)
class PhaseViewContent extends StatefulWidget {
  final ActiveSpearhead spearheadData;
  const PhaseViewContent({required this.spearheadData, super.key});
  

  @override
  State<PhaseViewContent> createState() => _PhaseViewContentState();
}

class _PhaseViewContentState extends State<PhaseViewContent> {
  PhaseSubView _currentSubView = PhaseSubView.hero;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
          child: Container(
            padding: const EdgeInsets.all(4), // inner padding around the selection pills
            decoration: BoxDecoration(
              color: Colors.grey[200], // unified background container
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              children: [
                _segmentedTab('Hero', PhaseSubView.hero),
                _segmentedTab('Move', PhaseSubView.move),
                _segmentedTab('Ranged', PhaseSubView.ranged),
                _segmentedTab('Charge', PhaseSubView.charge),
                _segmentedTab('Fight', PhaseSubView.fight),
                _segmentedTab('End', PhaseSubView.endOfTurn)
              ],
            ),
          ),
        ),

        // --- CONTENT AREA ---
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: _buildSubViewBody(),
          ),
        ),
      ],
    );
  }

  // builds an individual segmented item tab
  Widget _segmentedTab(String label, PhaseSubView viewType) {
    final bool isSelected = _currentSubView == viewType;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _currentSubView = viewType;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            // When selected, it gets the dark theme color pill background
            color: isSelected ? const Color(0xFF5A5568) : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[600],
                fontWeight: FontWeight.w600,
                fontSize: 13, // Slightly smaller to comfortably fit 6 items across the screen
              ),
            ),
          ),
        ),
      ),
    );
  }

  //TODO: I do not believe I am currently capturing all of what can be done in a phase. 
  //I need to take a step back and thourghouly think about what will be displayed on the phase view.
  Widget _buildSubViewBody() {
    ActiveSpearhead spearhead = widget.spearheadData;
    switch (_currentSubView) {
      case PhaseSubView.hero:
        return _switchBuilder(spearhead.allAbilitiesFiltered(phase: AbilityPhase.heroPhase)); //TODO: posible bug with "your hero phase" should probably be generalized at some point.
      case PhaseSubView.move:
        return _switchBuilder(spearhead.allAbilitiesFiltered(phase: AbilityPhase.movementPhase));
      case PhaseSubView.ranged:
        return  _switchBuilder(spearhead.allAbilitiesFiltered(phase: AbilityPhase.shootingPhase));
      case PhaseSubView.charge:
        return _switchBuilder(spearhead.allAbilitiesFiltered(phase: AbilityPhase.chargePhase));
      case PhaseSubView.fight:
        return  _switchBuilder(spearhead.allAbilitiesFiltered(phase: AbilityPhase.combatPhase));
      case PhaseSubView.endOfTurn:
        return _switchBuilder(spearhead.mergedAllEndOfTurn_PhaseAbilities);
    }
  }
  
  ///Controls the logic for the phase view then sends it off to the UI controller or returns a UI "Null"
  Widget _switchBuilder(List<CompiledWarscrollAbility> spearheadAbilityPhase) {
    //"UI Null"
    if (spearheadAbilityPhase.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: Text('Nothing to do here')),
      );
    }

    //TODO: Check to see if the selected enhancement/regement ability or battle traits are part of the given phase, Currently Hero phase seems to be working? either that or just enhancement picks
    //then makes a temporart edit of the given list
    ActiveSpearhead spearhead = widget.spearheadData;
    CompiledSpearheadRule enhancementPick = widget.spearheadData.selectedEnhancement;
    CompiledSpearheadRule regimentPick = widget.spearheadData.selectedRegimentAbility;
    //optimization for lazyBuilding
    List<CompiledSpearheadRule> lazyBuildPicks = [];
    //If the selected enhancement is part of the phase add it to the UI
      if (_abilityIsPartOfPhase(enhancementPick)) lazyBuildPicks.add(enhancementPick);
      //If the selected regigment ability is part of the phase, add it to the UI
      if (_abilityIsPartOfPhase(regimentPick)) lazyBuildPicks.add(regimentPick);

    return ListView(
      key: ValueKey(_currentSubView),
      children: [
         _populateCards(spearheadAbilityPhase),
        //populate so long as the picks arent empty
        if(lazyBuildPicks.isNotEmpty)
          _populateCardRules(lazyBuildPicks),
        //If ANY battle traits aren't passive and are part of the phase, add it
        if(spearhead.nonPassiveBattleTraits.isNotEmpty)
        _populateCardRules(spearhead.nonPassiveBattleTraits.where((battleTrait) => battleTrait.timing!.contains(_currentSubView.phaseTiming) && battleTrait.abilityName != enhancementPick.abilityName).toList()),
        //Populate out the fight phases TODO: Might wanna add a setting to have the user select if they want to have the abilities (_switchBuilder) or weapons display first
        // if(_currentSubView == PhaseSubView.fight)
        //   _populateCardWeapon(spearhead.allMeleeWeapons()),
        // if(_currentSubView == PhaseSubView.ranged)
        //   _populateCardWeapon(spearhead.allRangedWeapons())
      ],
    );
  }

  // Widget _populateCards() UI controller element
  // => Return a clickable card correctly gets all cards associated wtih a certain phase. 
  Widget _populateCards(List<CompiledWarscrollAbility> spearheadAbilites) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(spearheadAbilites.length, (index) {
        final ability = spearheadAbilites[index];
        return abilityCard(
          usage: ability.abilityType.capitalize(),
          title: ability.abilityName.capitalize(),
          description: ability.description.capitalize(),
        );
      }),
    );
  }

  Widget _populateCardRules(List<CompiledSpearheadRule> spearheadAbilites) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(spearheadAbilites.length, (index) {
        final ability = spearheadAbilites[index];
        return abilityCard(
          usage: ability.abilityType.capitalize(),
          title: ability.abilityName.capitalize(),
          description: ability.description.capitalize(),
        );
      }),
    );
  }

    //TODO: need to stylize this and implement
  //   Widget _populateCardWeapon(List<CompiledWeapon> spearheadAbilites) {
  //   return ListView.builder(
  //     itemCount: spearheadAbilites.length,
  //     itemBuilder: (context, index) {
  //       final ability = spearheadAbilites[index];
  //       return weaponCard(
  //         usage: ability.abilityType.capitalize(),
  //         title: ability.abilityName.capitalize(),
  //         description: ability.description.capitalize(),
  //       );
  //     },
  //   );
  // }



  ///Checks the given CompiledWarscrollAbility and returns weather or not it is part of the current PhaseSubView
  bool _abilityIsPartOfPhase(CompiledSpearheadRule ability)
  {
    //IF the current view is hero AND the enhancement/regiment/battle trait is in the hero phase and not passive
      //is a enhancement/regement ability passive?
      if (ability.abilityType != 'passive') {
        //if not we can conclude it is active
        //perform a null-safe timing check
        if (ability.timing != null && ability.timing!.contains(_currentSubView.phaseTiming)) {
          return true;
        }
      }
    return false;
  }

// -----------------------------------------------------------------------------
// TODO: PORT TO UTILS BUT THEY LIVE HERE FOR NOW (wasnt working to import it)
// ------------------------------------------------------------------------
  Widget abilityCard({
          required String usage, required String title,
          required String description, IconData icon = Icons.hide_image}) 
    => Card
    (
    elevation: 5.0,
    child: ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          const Spacer(flex: 4),
          Icon(icon), // This should be replaced with the spearhead faction image
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(usage.capitalize()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(description.capitalize()),
          ),
        ],
      ),
    ),
  );
  
  //TODO: Finish weapon card
  // Widget weaponCard(CompiledWeapon weapon)
  // {
    
  // }

}