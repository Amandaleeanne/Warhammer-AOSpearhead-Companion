import 'package:warhammer/global_imports.dart';
import 'package:warhammer/programming_utils/common/utils.dart';
import 'package:warhammer/programming_utils/dartDB/compiledSpearhead.dart';
enum PhaseSubView { hero, move, ranged, charge, fight, endOfTurn } //Although a copy of Ability phase, it is not being reused for simplicty

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
        return  ListView( //TODO: Might wanna add a setting to have the user select if they want to have the abilities (_switchBuilder) or weapons display first
          children: [
            _switchBuilder(spearhead.allAbilitiesFiltered(phase: AbilityPhase.shootingPhase)),
          ],
        );
      case PhaseSubView.charge:
        return _switchBuilder(spearhead.allAbilitiesFiltered(phase: AbilityPhase.chargePhase));
      case PhaseSubView.fight:
        return  ListView( //TODO: Might wanna add a setting to have the user select if they want to have the abilities (_switchBuilder) or weapons display first
          children: [
            _switchBuilder(spearhead.allAbilitiesFiltered(phase: AbilityPhase.combatPhase)),
          ],
        );
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

    //Check to see if the selected enhancement/regement ability or battle traits are part of the given phase
    //then makes a temporart edit of the given list
    List<CompiledWarscrollAbility> editedList = spearheadAbilityPhase;
    ActiveSpearhead spearhead = widget.spearheadData;
    //IF the current view is hero AND the enhancement/regiment/battle trait is in the hero phase and not passive
      //is a enhancement/regement ability passive?
      if(spearhead.selectedEnhancement.timing != 'passive')
      {
        //if not we can conclude it is active
      }
  //get all non passive battle traits and filter them by phase and given 
    //add code to grab battle traits from activeSpearhead (need to edit ActiveSpearhead)

    return _populateCards(editedList);
  }

  // Widget _populateCards() UI controller element
  // => Return a clickable card correctly gets all cards associated wtih a certain phase. 
  Widget _populateCards(List<CompiledWarscrollAbility> spearheadAbilites) {
    return ListView.builder(
      itemCount: spearheadAbilites.length,
      itemBuilder: (context, index) {
        final ability = spearheadAbilites[index];
        return abilityCard(
          usage: ability.abilityType.capitalize(),
          title: ability.abilityName.capitalize(),
          description: ability.description.capitalize(),
        );
      },
    );
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
  
  // Widget weaponCardList({List<CompiledWeapon>? displayWeapons})
  // {
  //   return 
  // }

}