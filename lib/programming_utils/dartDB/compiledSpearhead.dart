// ignore_for_file: non_constant_identifier_names

import 'package:warhammer/global_imports.dart';

class ActiveSpearhead 
{

  final String spearheadName;

  final List<ActiveUnit> units;

  final List<CompiledSpearheadRule> activeRules;

  final CompiledSpearheadRule selectedRegimentAbility;

  final CompiledSpearheadRule selectedEnhancement;

  ActiveSpearhead({
    required this.spearheadName,
    required this.units,
    required this.activeRules,
    required this.selectedRegimentAbility,
    required this.selectedEnhancement,
  });

  //Duplication detection (Thank you stack overflow)
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActiveSpearhead &&
          runtimeType == other.runtimeType &&
          spearheadName == other.spearheadName &&
          selectedRegimentAbility == other.selectedRegimentAbility &&
          selectedEnhancement == other.selectedEnhancement;

  @override
  int get hashCode =>
      spearheadName.hashCode ^
      selectedRegimentAbility.hashCode ^
      selectedEnhancement.hashCode;
  // --- Army stuff -----
    ///Gets any and all battle traits (no filter)
    List<CompiledSpearheadRule> get battleTraits =>
      activeRules.where(
        (r) => r.ruleCategory == 'battle trait',
      ).toList();


    ///Gets all Battle Traits in the ActiveSpearhead
    ///
    ///Example:
    ///```
    ///activeSpearhead.battleTraitsFiltered(
    ///  phase: AbilityPhase.heroPhase,
    ///  type: AbilityType.passive,
    /// );
    /// ```
    ///```battleTraitsFiltered()``` => returns everything
    ///
    ///```battleTraitsFiltered(phase: [hero etc..])``` => returns everything filtered by phase
    ///
    ///```battleTraitsFiltered(type: [passive etc..])``` => returns everything filtere by type
    ///
    ///```battleTraitsFiltered(phase: [hero etc..], type: [passive etc..])``` => filters by both
    List<CompiledSpearheadRule> battleTraitsFiltered({AbilityPhase? phase,AbilityType? type}) {
      return battleTraits.where((r) {
        final matchesPhase =
            phase == null ||
            r.timing.toAbilityPhase() == phase;

        final matchesType =
            type == null ||
            r.abilityType.toAbilityType() == type;

        return matchesPhase && matchesType;
      }).toList();
    }

  // ------------ Universal ability filters -----------
  ///Gets all abilities in the ActiveSpearhead
  ///
  ///Example:
  ///```
  ///activeSpearhead.allAbilitiesFiltered(
  ///  phase: AbilityPhase.heroPhase,
  ///  type: AbilityType.passive,
  /// );
  /// ```
  ///```allAbilitiesFiltered()``` => returns everything
  ///
  ///```allAbilitiesFiltered(phase: [hero etc..])``` => returns everything filtered by phase
  ///
  ///```allAbilitiesFiltered(type: [passive etc..])``` => returns everything filtere by type
  ///
  ///```allAbilitiesFiltered(phase: [hero etc..], type: [passive etc..])``` => filters by both
  List<CompiledWarscrollAbility> allAbilitiesFiltered({AbilityPhase? phase,AbilityType? type}) 
  =>units.expand((u) {
      return u.abilityTraitsFiltered(
        phase: phase,
        type: type,
      );
    }).toList();
  
  List<CompiledWarscrollAbility> get mergedAllEndOfTurn_PhaseAbilities{
    List<CompiledWarscrollAbility> mergedList =  units.expand((u) => u.abilityTraitsFiltered(phase: AbilityPhase.endOfAnyTurn)).toList();
    mergedList.addAll(units.expand((u) => u.abilityTraitsFiltered(phase: AbilityPhase.endOfYourTurn)).toList());
    return mergedList;
  }

  // ----------- Universal Weapon filters -------------
  List<CompiledWeapon> allMeleeWeapons() 
  => units.expand((u) => u.meleeWeapons).toList();
  List<CompiledWeapon> allRangedWeapons() 
  => units.expand((u) => u.rangedWeapons).toList();

}

class ActiveUnit {

  final CompiledUnit unit;

  final List<CompiledWeapon> weapons;

  final List<CompiledWarscrollAbility> abilities;

  ActiveUnit({
    required this.unit,
    required this.weapons,
    required this.abilities,
  });

  // ------- Simple getters -------

  String get name => unit.warscrollName;

  int get id => unit.warscrollId;

  int get move => unit.move;

  int get health => unit.health;

  int get save => unit.save;

  int get control => unit.control;

  int? get ward => unit.ward;

  bool get isGeneral => unit.isGeneral;

  bool get hasRangedWeapon => rangedWeapons.isNotEmpty;

  bool get hasMeleeWeapon => meleeWeapons.isNotEmpty;

  String? get imagePath =>
      unit.imagePath;

  // ----- Weapons (unit level) ----------
  // ======================================

  List<CompiledWeapon> get meleeWeapons =>
      weapons.where(
        (w) => w.range == 0,
      ).toList();

  List<CompiledWeapon> get rangedWeapons =>
      weapons.where(
        (w) => w.range > 0,
      ).toList();

  // -------------- Filtered Abilities and Phase----------------

  List<CompiledWarscrollAbility> abilityTraitsFiltered({AbilityPhase? phase,AbilityType? type}) {
     return abilities.where((r) {
       final matchesPhase =
           phase == null ||
           r.timing.toAbilityPhase() == phase;

       final matchesType =
           type == null ||
           r.abilityType.toAbilityType() == type;

       return matchesPhase && matchesType;
     }).toList();
   }

    
}