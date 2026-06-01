
import 'dart:io'; // For the File class
import 'package:drift/drift.dart'; // For the core Drift logic
import 'package:drift/native.dart'; // For NativeDatabase
import 'package:path_provider/path_provider.dart'; // To find the app's folder
import 'package:path/path.dart' as p; // To join folder paths safely
import 'package:flutter/services.dart' show rootBundle; // To load your asset
import 'package:warhammer/programming_utils/dartDB/compiledSpearhead.dart'; //imports the models
part 'spearhead_database.g.dart';

@DriftDatabase(
  include: {'tables.drift'}, // links SQL definitions
)

/// Contains the model for the entire database and allows setup for ActiveSpearhead.
class WarhammerDatabase extends _$WarhammerDatabase {
  // Update the constructor to call the connection logic automatically
  WarhammerDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<ActiveSpearhead> getActiveSpearhead({
  required String spearheadName,
  required int regimentAbilityId,
  required int enhancementAbilityId,
}) async {

  final units =
      await getCompiledUnits(spearheadName).get();

  final weapons =
      await getCompiledWeapons(spearheadName).get();

  final warscrollAbilities =
      await getCompiledWarscrollAbilities(
        spearheadName,
      ).get();

  final spearheadAbilities =
      await getCompiledSpearheadAbilities(
        spearheadName,
      ).get();

  // =====================================
  // GROUP WEAPONS
  // =====================================

  final weaponsByWarscroll =
      <int, List<CompiledWeapon>>{};

  for (final weapon in weapons) {
    weaponsByWarscroll
        .putIfAbsent(
          weapon.warscrollId,
          () => [],
        )
        .add(weapon);
  }

  // =====================================
  // GROUP ABILITIES
  // =====================================

  final abilitiesByWarscroll =
      <int, List<CompiledWarscrollAbility>>{};

  for (final ability in warscrollAbilities) {
    abilitiesByWarscroll
        .putIfAbsent(
          ability.warscrollId,
          () => [],
        )
        .add(ability);
  }

  // =====================================
  // BUILD ACTIVE UNITS
  // =====================================

  final activeUnits = units.map((unit) {

    return ActiveUnit(
      unit: unit,
      weapons:
          weaponsByWarscroll[unit.warscrollId] ?? [],
      abilities:
          abilitiesByWarscroll[unit.warscrollId] ?? [],
    );

  }).toList();

  // =====================================
  // FILTER RULES
  // =====================================

  final battleTraits = spearheadAbilities.where(
    (r) => r.ruleCategory == 'battle trait',
  );

  final regimentAbility = spearheadAbilities.firstWhere(
    (r) => r.abilityId == regimentAbilityId,
  );

  final enhancement = spearheadAbilities.firstWhere(
    (r) => r.abilityId == enhancementAbilityId,
  );

  final activeRules = [
    ...battleTraits,
    regimentAbility,
    enhancement,
  ];

  return ActiveSpearhead(
    spearheadName: spearheadName,
    units: activeUnits,
    activeRules: activeRules,
    selectedRegimentAbility: regimentAbility,
    selectedEnhancement: enhancement,
  );
}

}

/// actual connection logic
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // Find the local folder on the user's pplatform
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'spearhead.db'));

    // Copy from assets only if the file doesn't exist yet
    if (!await file.exists()) {
      final data = await rootBundle.load('databases/spearhead.db');
      final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await file.writeAsBytes(bytes);
    }

    return NativeDatabase(file);
  });
}