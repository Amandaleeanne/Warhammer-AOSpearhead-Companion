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
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
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
          padding: const EdgeInsets.symmetric(vertical: 8),
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
      //TODO: possible bug with "your hero phase" should probably be generalized at some point. Currently regex is handling it but I am unsure if that will be sufficient.
      case PhaseSubView.hero:
        return _switchBuilder(spearhead.allAbilitiesFiltered(phase: AbilityPhase.heroPhase)); 
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
  Widget _switchBuilder(List<CompiledWarscrollAbility> filteredAbilities) {

    //Init
      ActiveSpearhead spearhead= widget.spearheadData; //i dont wanna type this a bunch of times
      List<CompiledSpearheadAbilities> battleTraits = spearhead.nonPassiveBattleTraits.where(
                                                      (battleTrait) => ((battleTrait.timing?.contains(_currentSubView.phaseTiming)) ?? false)
                                                    ).toList(); // <- optimization for mapping and queries

    //optimization for allowing lazy adding enhancements and regiment picks to the viewer
      List<CompiledSpearheadAbilities> lazyBuildPicks = [];
        if (_abilityIsPartOfPhase(spearhead.selectedEnhancement)) lazyBuildPicks.add(spearhead.selectedEnhancement);
        if (_abilityIsPartOfPhase(spearhead.selectedRegimentAbility)) lazyBuildPicks.add(spearhead.selectedRegimentAbility);

    //"UI Null"
      if (lazyBuildPicks.isEmpty && battleTraits.isEmpty && !phaseHasCombatData(spearhead)) {
        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(child: Text('Nothing to do here')),
        );
      }

    return ListView(
      padding: EdgeInsets.fromLTRB(16, 10, 16, 30),
      key: ValueKey(_currentSubView),
      children: [
         _populateCards(filteredAbilities),
        //populate so long as the picks arent empty
        if(lazyBuildPicks.isNotEmpty)
          _populateCardRules(lazyBuildPicks),
        //If ANY battle traits aren't passive and are part of the phase, add it
        if(battleTraits.isNotEmpty)
          _populateCardRules(battleTraits),
        
        
        //Populate out the fight phases 
        //TODO: FEATURE; Might wanna add a setting to have the user select if they want to have the abilities (_switchBuilder) or weapons display first
        
        if(_currentSubView == PhaseSubView.fight)
          _populateweapons(spearhead.allMeleeWeapons()),
        if(_currentSubView == PhaseSubView.ranged)
          _populateweapons(spearhead.allRangedWeapons())
      ],
    );
  }
  ///Checks to see if there is any data within the ranged or melee
  bool phaseHasCombatData(ActiveSpearhead spearhead){
    if (_currentSubView == PhaseSubView.fight && spearhead.allMeleeWeapons().isNotEmpty) return true;
    if (_currentSubView == PhaseSubView.ranged && spearhead.allRangedWeapons().isNotEmpty) return true;
    return false;
  }


  // Widget _populateCards() UI controller element
  // => Return a clickable card correctly gets all cards associated wtih a certain phase. TODO: Make it clickable and have it direct to the correct unit card popup
  Widget _populateCards(List<CompiledWarscrollAbility> spearheadAbilites) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(spearheadAbilites.length, (index) {
        final ability = spearheadAbilites[index];
        return CommonUtils.abilityCard(
          usage: ability.abilityType,
          who: ability.warscrollName.capitalize(),
          title: ability.abilityName.capitalize(),
          description: ability.description.capitalize(),
        );
      }),
    );
  }

  Widget _populateCardRules(List<CompiledSpearheadAbilities> spearheadAbilites) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(spearheadAbilites.length, (index) {
        final ability = spearheadAbilites[index];
        return CommonUtils.abilityCard(
          usage: ability.abilityType.capitalize(),
          title: ability.abilityName.capitalize(),
          description: ability.description.capitalize(),
        );
      }),
    );
  }

  //Add populate weapon card here
    Widget _populateweapons(List<CompiledWeapon> spearheadWeapons) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(spearheadWeapons.length, (index) {
        final weapon = spearheadWeapons[index];
        return _weaponCard(weapon);
      }),
    );
  }

  ///Checks the given CompiledSpearheadAbility and returns weather or not it is part of the current PhaseSubView
  bool _abilityIsPartOfPhase(CompiledSpearheadAbilities ability)
  {
    //The only time the timing is null should be when it is passive. 
      if (ability.timing != null && ability.timing!.contains(_currentSubView.phaseTiming)) {
          return true;
      }
    return false;
  }  
  //TODO: Finish weapon card

  /// returns a weapon card 
  Widget _weaponCard(CompiledWeapon weapon)
  => Card(
    elevation: 5.0, // Keeping your existing shadow style
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: _drawWeaponIcons(weapon), 
          ),

          Expanded(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${weapon.weaponName.capitalize()} used by ${weapon.warscrollName.capitalize()}",
                  style: TextStyle(
                    fontSize: 15
                  ),
                  ),
                // 2. The Gray Stats Box goes here
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: _drawWeaponInfo(weapon),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );

  
  Widget _drawWeaponIcons(CompiledWeapon weapon) => weapon.range == 0 ?  CommonUtils.drawMeleeIcon() : CommonUtils.drawRangedIcon();

  Widget _drawWeaponInfo(CompiledWeapon weapon)
  =>Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
      children: [
        if (weapon.range != 0) //melee no need for range data
         _drawWeaponColumn(title: "Range", data: weapon.range),
        _drawWeaponColumn(title: "A", data: weapon.attacks),
        _drawWeaponColumn(title: "Hit", data: weapon.hit),
        _drawWeaponColumn(title: "W", data: weapon.wound),
        _drawWeaponColumn(title: "R", data: weapon.rend),
        _drawWeaponColumn(title: "D", data: weapon.damage),
      ],
    );
  
  //var data because it can be a string or an int but Text() treats it the same anyway
    Widget _drawWeaponColumn({required String title, required var data}) 
      =>Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title, 
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)
            ),
            const SizedBox(height: 4), // A little spacing between title and data
            Text(
              "${data}", 
              style: const TextStyle(fontSize: 16)
            ), 
          ],
        ),
      );

  

}