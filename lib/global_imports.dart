export 'package:flutter/material.dart';
export 'package:provider/provider.dart';
export 'package:warhammer/programming_utils/dartDB/spearhead_database.dart';
export 'package:warhammer/programming_utils/common/utils.dart';



// Source - https://stackoverflow.com/a/60528001
// Posted by Hannah Stark, modified by community. See post 'Timeline' for change history
// Retrieved 2026-05-06, License - CC BY-SA 4.0
extension StringExtension on String {
    String capitalize() {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
}

//Global Classes
class GameSettings {
  static late final bool? _isVsMode;
  bool get isVsMode => _isVsMode ?? false; // Default to false if read before set
  void initializeMode(bool value) => (_isVsMode == null) ? _isVsMode = value : print("Warning: isVsMode has already been set and cannot be changed.");

}

//Abilities:
enum AbilityType {
  passive,
  oncePerTurn,
  oncePerBattle,
  reaction,
  oncePerRound,
}

enum AbilityPhase {
  heroPhase,
  movementPhase,
  chargePhase,
  shootingPhase,
  combatPhase,
  endOfAnyTurn,
  endOfYourTurn,
}

extension AbilityTypeParsing on String {
  AbilityType toAbilityType() {
    switch (this) {
      case 'passive':
        return AbilityType.passive;

      case 'once per turn':
        return AbilityType.oncePerTurn;

      case 'once per battle':
        return AbilityType.oncePerBattle;

      case 'reaction':
        return AbilityType.reaction;

      case 'once per round':
        return AbilityType.oncePerRound;

      default:
        throw Exception('Unknown ability type: $this');
    }
  }
}

extension AbilityPhaseParsing on String? {
  AbilityPhase? toAbilityPhase() {
    switch (this) {
      case 'your hero phase':
        return AbilityPhase.heroPhase;

      case 'your movement phase':
        return AbilityPhase.movementPhase;

      case 'your charge phase':
        return AbilityPhase.chargePhase;

      case 'any shooting phase':
        return AbilityPhase.shootingPhase;

      case 'any combat phase':
        return AbilityPhase.combatPhase;

      case 'end of any turn':
        return AbilityPhase.endOfAnyTurn;

      case 'end of your turn':
        return AbilityPhase.endOfYourTurn;

      default:
        return null;
    }
  }
}