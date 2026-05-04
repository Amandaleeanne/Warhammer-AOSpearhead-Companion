
import 'dart:io'; // For the File class
import 'package:drift/drift.dart'; // For the core Drift logic
import 'package:drift/native.dart'; // For NativeDatabase
import 'package:path_provider/path_provider.dart'; // To find the app's folder
import 'package:path/path.dart' as p; // To join folder paths safely
import 'package:flutter/services.dart' show rootBundle; // To load your asset

part 'spearhead_database.g.dart';

@DriftDatabase(
  include: {'tables.drift'}, // links SQL definitions
)
class WarhammerDatabase extends _$WarhammerDatabase {
  // Update the constructor to call the connection logic automatically
  WarhammerDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
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