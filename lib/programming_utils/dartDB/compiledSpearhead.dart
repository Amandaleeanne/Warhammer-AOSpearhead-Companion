import 'package:warhammer/global_imports.dart';

class ActiveSpearhead {

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

  // ------------ Universal filters -----------

  List<CompiledWarscrollAbility> get allPassiveAbilities =>
    units.expand((u) => u.passiveAbilities).toList();
  
  List<CompiledWarscrollAbility> get allHeroPhaseAbilities =>
    units.expand((u) => u.heroPhaseAbilities).toList();

  List<CompiledWarscrollAbility> get allMovementPhaseAbilities =>
    units.expand((u) => u.movementPhaseAbilities).toList();
  
  List<CompiledWarscrollAbility> get allChargePhaseAbilities =>
    units.expand((u) => u.chargePhaseAbilities).toList();

  List<CompiledWarscrollAbility> get allRangedPhaseAbilities =>
    units.expand((u) => u.rangedPhaseAbilities).toList();

  List<CompiledWarscrollAbility> get allAnyCombatPhaseAbilities =>
    units.expand((u) => u.anyCombatPhaseAbilities).toList();

  List<CompiledWarscrollAbility> get allEndOfAnyTurnPhaseAbilities =>
    units.expand((u) => u.endofanyturnPhaseAbilities).toList();
  
  List<CompiledWarscrollAbility> get allEndOfYourTurnPhaseAbilities =>
    units.expand((u) => u.endofanyturnPhaseAbilities).toList();
  
  List<CompiledWarscrollAbility> get mergedAllEndOfTurnPhaseAbilities{
    List<CompiledWarscrollAbility> mergedList =  units.expand((u) => u.endofanyturnPhaseAbilities).toList();
    mergedList.addAll(units.expand((u) => u.endofanyturnPhaseAbilities).toList());
    return mergedList;

  }

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

  // -------------- Filtered Abilities ----------------

  // ----------- "Passive" ---------------------
  List<CompiledWarscrollAbility> get passiveAbilities =>
      abilities.where(
        (a) => a.abilityType == 'passive'
      ).toList();

  List<CompiledWarscrollAbility> get reactionAbilities =>
      abilities.where(
        (a) => a.abilityType == 'reaction'
      ).toList();

  List<CompiledWarscrollAbility> get oncePerTurnAbilities =>
      abilities.where(
        (a) => a.abilityType == 'once per turn'
      ).toList();

  List<CompiledWarscrollAbility> get oncePerBattleAbilities =>
      abilities.where(
        (a) => a.abilityType == 'once per battle'
      ).toList();

  //----------- Phase Getters --------------------
  List<CompiledWarscrollAbility> get heroPhaseAbilities =>
  abilities.where(
        (a) => a.timing == 'your hero phase'
      ).toList();
  
  List<CompiledWarscrollAbility> get movementPhaseAbilities =>
  abilities.where(
        (a) => a.timing == 'your movement phase'
      ).toList();

  List<CompiledWarscrollAbility> get chargePhaseAbilities =>
  abilities.where(
        (a) => a.timing == 'your charge phase'
      ).toList();

  List<CompiledWarscrollAbility> get rangedPhaseAbilities =>
  abilities.where(
        (a) => a.timing == 'any shooting phase'
      ).toList();

  List<CompiledWarscrollAbility> get anyCombatPhaseAbilities =>
  abilities.where(
        (a) => a.timing == 'any combat phase'
      ).toList();
  
  List<CompiledWarscrollAbility> get endofanyturnPhaseAbilities =>
  abilities.where(
        (a) => a.timing == 'end of any turn'
      ).toList();

  List<CompiledWarscrollAbility> get endofYourTurnPhaseAbilities =>
  abilities.where(
        (a) => a.timing == 'end of your turn'
      ).toList();
    
}