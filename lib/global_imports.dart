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