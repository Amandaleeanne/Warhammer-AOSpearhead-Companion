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

  // ======================================
  // SIMPLE ACCESSORS
  // ======================================

  String get name => unit.warscrollName;

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

  // ======================================
  // FILTERED WEAPONS
  // ======================================

  List<CompiledWeapon> get meleeWeapons =>
      weapons.where(
        (w) => w.range == 0,
      ).toList();

  List<CompiledWeapon> get rangedWeapons =>
      weapons.where(
        (w) => w.range > 0,
      ).toList();
}