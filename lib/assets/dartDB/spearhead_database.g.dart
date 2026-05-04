// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spearhead_database.dart';

// ignore_for_file: type=lint
class Armies extends Table with TableInfo<Armies, Army> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Armies(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, imagePath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'armies';
  @override
  VerificationContext validateIntegrity(
    Insertable<Army> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Army map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Army(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
    );
  }

  @override
  Armies createAlias(String alias) {
    return Armies(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Army extends DataClass implements Insertable<Army> {
  final int id;
  final String name;
  final String? imagePath;
  const Army({required this.id, required this.name, this.imagePath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    return map;
  }

  ArmiesCompanion toCompanion(bool nullToAbsent) {
    return ArmiesCompanion(
      id: Value(id),
      name: Value(name),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
    );
  }

  factory Army.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Army(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      imagePath: serializer.fromJson<String?>(json['image_path']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image_path': serializer.toJson<String?>(imagePath),
    };
  }

  Army copyWith({
    int? id,
    String? name,
    Value<String?> imagePath = const Value.absent(),
  }) => Army(
    id: id ?? this.id,
    name: name ?? this.name,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
  );
  Army copyWithCompanion(ArmiesCompanion data) {
    return Army(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Army(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, imagePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Army &&
          other.id == this.id &&
          other.name == this.name &&
          other.imagePath == this.imagePath);
}

class ArmiesCompanion extends UpdateCompanion<Army> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> imagePath;
  const ArmiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.imagePath = const Value.absent(),
  });
  ArmiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.imagePath = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Army> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? imagePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (imagePath != null) 'image_path': imagePath,
    });
  }

  ArmiesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? imagePath,
  }) {
    return ArmiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArmiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }
}

class Spearheads extends Table with TableInfo<Spearheads, Spearhead> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Spearheads(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY',
  );
  static const VerificationMeta _armyIdMeta = const VerificationMeta('armyId');
  late final GeneratedColumn<int> armyId = GeneratedColumn<int>(
    'army_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES armies(id)',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  @override
  List<GeneratedColumn> get $columns => [id, armyId, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'spearheads';
  @override
  VerificationContext validateIntegrity(
    Insertable<Spearhead> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('army_id')) {
      context.handle(
        _armyIdMeta,
        armyId.isAcceptableOrUnknown(data['army_id']!, _armyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_armyIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Spearhead map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Spearhead(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      armyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}army_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  Spearheads createAlias(String alias) {
    return Spearheads(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Spearhead extends DataClass implements Insertable<Spearhead> {
  final int id;
  final int armyId;
  final String name;
  const Spearhead({required this.id, required this.armyId, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['army_id'] = Variable<int>(armyId);
    map['name'] = Variable<String>(name);
    return map;
  }

  SpearheadsCompanion toCompanion(bool nullToAbsent) {
    return SpearheadsCompanion(
      id: Value(id),
      armyId: Value(armyId),
      name: Value(name),
    );
  }

  factory Spearhead.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Spearhead(
      id: serializer.fromJson<int>(json['id']),
      armyId: serializer.fromJson<int>(json['army_id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'army_id': serializer.toJson<int>(armyId),
      'name': serializer.toJson<String>(name),
    };
  }

  Spearhead copyWith({int? id, int? armyId, String? name}) => Spearhead(
    id: id ?? this.id,
    armyId: armyId ?? this.armyId,
    name: name ?? this.name,
  );
  Spearhead copyWithCompanion(SpearheadsCompanion data) {
    return Spearhead(
      id: data.id.present ? data.id.value : this.id,
      armyId: data.armyId.present ? data.armyId.value : this.armyId,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Spearhead(')
          ..write('id: $id, ')
          ..write('armyId: $armyId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, armyId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Spearhead &&
          other.id == this.id &&
          other.armyId == this.armyId &&
          other.name == this.name);
}

class SpearheadsCompanion extends UpdateCompanion<Spearhead> {
  final Value<int> id;
  final Value<int> armyId;
  final Value<String> name;
  const SpearheadsCompanion({
    this.id = const Value.absent(),
    this.armyId = const Value.absent(),
    this.name = const Value.absent(),
  });
  SpearheadsCompanion.insert({
    this.id = const Value.absent(),
    required int armyId,
    required String name,
  }) : armyId = Value(armyId),
       name = Value(name);
  static Insertable<Spearhead> custom({
    Expression<int>? id,
    Expression<int>? armyId,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (armyId != null) 'army_id': armyId,
      if (name != null) 'name': name,
    });
  }

  SpearheadsCompanion copyWith({
    Value<int>? id,
    Value<int>? armyId,
    Value<String>? name,
  }) {
    return SpearheadsCompanion(
      id: id ?? this.id,
      armyId: armyId ?? this.armyId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (armyId.present) {
      map['army_id'] = Variable<int>(armyId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpearheadsCompanion(')
          ..write('id: $id, ')
          ..write('armyId: $armyId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class Keywords extends Table with TableInfo<Keywords, Keyword> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Keywords(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'keywords';
  @override
  VerificationContext validateIntegrity(
    Insertable<Keyword> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Keyword map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Keyword(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  Keywords createAlias(String alias) {
    return Keywords(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Keyword extends DataClass implements Insertable<Keyword> {
  final int id;
  final String name;
  const Keyword({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  KeywordsCompanion toCompanion(bool nullToAbsent) {
    return KeywordsCompanion(id: Value(id), name: Value(name));
  }

  factory Keyword.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Keyword(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Keyword copyWith({int? id, String? name}) =>
      Keyword(id: id ?? this.id, name: name ?? this.name);
  Keyword copyWithCompanion(KeywordsCompanion data) {
    return Keyword(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Keyword(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Keyword && other.id == this.id && other.name == this.name);
}

class KeywordsCompanion extends UpdateCompanion<Keyword> {
  final Value<int> id;
  final Value<String> name;
  const KeywordsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  KeywordsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Keyword> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  KeywordsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return KeywordsCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KeywordsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class Warscrolls extends Table with TableInfo<Warscrolls, Warscroll> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Warscrolls(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY',
  );
  static const VerificationMeta _spearheadIdMeta = const VerificationMeta(
    'spearheadId',
  );
  late final GeneratedColumn<int> spearheadId = GeneratedColumn<int>(
    'spearhead_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES spearheads(id)',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _moveMeta = const VerificationMeta('move');
  late final GeneratedColumn<int> move = GeneratedColumn<int>(
    'move',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _healthMeta = const VerificationMeta('health');
  late final GeneratedColumn<int> health = GeneratedColumn<int>(
    'health',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _saveMeta = const VerificationMeta('save');
  late final GeneratedColumn<int> save = GeneratedColumn<int>(
    'save',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _wardMeta = const VerificationMeta('ward');
  late final GeneratedColumn<int> ward = GeneratedColumn<int>(
    'ward',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _controlMeta = const VerificationMeta(
    'control',
  );
  late final GeneratedColumn<int> control = GeneratedColumn<int>(
    'control',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 1',
    defaultValue: const CustomExpression('1'),
  );
  static const VerificationMeta _isGeneralMeta = const VerificationMeta(
    'isGeneral',
  );
  late final GeneratedColumn<bool> isGeneral = GeneratedColumn<bool>(
    'is_general',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    spearheadId,
    name,
    imagePath,
    move,
    health,
    save,
    ward,
    control,
    isGeneral,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'warscrolls';
  @override
  VerificationContext validateIntegrity(
    Insertable<Warscroll> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('spearhead_id')) {
      context.handle(
        _spearheadIdMeta,
        spearheadId.isAcceptableOrUnknown(
          data['spearhead_id']!,
          _spearheadIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_spearheadIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('move')) {
      context.handle(
        _moveMeta,
        move.isAcceptableOrUnknown(data['move']!, _moveMeta),
      );
    } else if (isInserting) {
      context.missing(_moveMeta);
    }
    if (data.containsKey('health')) {
      context.handle(
        _healthMeta,
        health.isAcceptableOrUnknown(data['health']!, _healthMeta),
      );
    } else if (isInserting) {
      context.missing(_healthMeta);
    }
    if (data.containsKey('save')) {
      context.handle(
        _saveMeta,
        save.isAcceptableOrUnknown(data['save']!, _saveMeta),
      );
    } else if (isInserting) {
      context.missing(_saveMeta);
    }
    if (data.containsKey('ward')) {
      context.handle(
        _wardMeta,
        ward.isAcceptableOrUnknown(data['ward']!, _wardMeta),
      );
    }
    if (data.containsKey('control')) {
      context.handle(
        _controlMeta,
        control.isAcceptableOrUnknown(data['control']!, _controlMeta),
      );
    }
    if (data.containsKey('is_general')) {
      context.handle(
        _isGeneralMeta,
        isGeneral.isAcceptableOrUnknown(data['is_general']!, _isGeneralMeta),
      );
    } else if (isInserting) {
      context.missing(_isGeneralMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {spearheadId, name},
  ];
  @override
  Warscroll map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Warscroll(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      spearheadId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}spearhead_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      move: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}move'],
      )!,
      health: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}health'],
      )!,
      save: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}save'],
      )!,
      ward: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ward'],
      ),
      control: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}control'],
      )!,
      isGeneral: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_general'],
      )!,
    );
  }

  @override
  Warscrolls createAlias(String alias) {
    return Warscrolls(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(spearhead_id, name)'];
  @override
  bool get dontWriteConstraints => true;
}

class Warscroll extends DataClass implements Insertable<Warscroll> {
  final int id;
  final int spearheadId;
  final String name;
  final String? imagePath;

  /// asset path, e.g. 'assets/icons/[army]/[warscroll].svg'
  /// Core stats
  final int move;

  /// inches
  final int health;

  /// wounds per model
  final int save;

  /// e.g. 4 means 4+
  final int? ward;

  /// NULL = no ward save
  final int control;
  final bool isGeneral;
  const Warscroll({
    required this.id,
    required this.spearheadId,
    required this.name,
    this.imagePath,
    required this.move,
    required this.health,
    required this.save,
    this.ward,
    required this.control,
    required this.isGeneral,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['spearhead_id'] = Variable<int>(spearheadId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['move'] = Variable<int>(move);
    map['health'] = Variable<int>(health);
    map['save'] = Variable<int>(save);
    if (!nullToAbsent || ward != null) {
      map['ward'] = Variable<int>(ward);
    }
    map['control'] = Variable<int>(control);
    map['is_general'] = Variable<bool>(isGeneral);
    return map;
  }

  WarscrollsCompanion toCompanion(bool nullToAbsent) {
    return WarscrollsCompanion(
      id: Value(id),
      spearheadId: Value(spearheadId),
      name: Value(name),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      move: Value(move),
      health: Value(health),
      save: Value(save),
      ward: ward == null && nullToAbsent ? const Value.absent() : Value(ward),
      control: Value(control),
      isGeneral: Value(isGeneral),
    );
  }

  factory Warscroll.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Warscroll(
      id: serializer.fromJson<int>(json['id']),
      spearheadId: serializer.fromJson<int>(json['spearhead_id']),
      name: serializer.fromJson<String>(json['name']),
      imagePath: serializer.fromJson<String?>(json['image_path']),
      move: serializer.fromJson<int>(json['move']),
      health: serializer.fromJson<int>(json['health']),
      save: serializer.fromJson<int>(json['save']),
      ward: serializer.fromJson<int?>(json['ward']),
      control: serializer.fromJson<int>(json['control']),
      isGeneral: serializer.fromJson<bool>(json['is_general']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'spearhead_id': serializer.toJson<int>(spearheadId),
      'name': serializer.toJson<String>(name),
      'image_path': serializer.toJson<String?>(imagePath),
      'move': serializer.toJson<int>(move),
      'health': serializer.toJson<int>(health),
      'save': serializer.toJson<int>(save),
      'ward': serializer.toJson<int?>(ward),
      'control': serializer.toJson<int>(control),
      'is_general': serializer.toJson<bool>(isGeneral),
    };
  }

  Warscroll copyWith({
    int? id,
    int? spearheadId,
    String? name,
    Value<String?> imagePath = const Value.absent(),
    int? move,
    int? health,
    int? save,
    Value<int?> ward = const Value.absent(),
    int? control,
    bool? isGeneral,
  }) => Warscroll(
    id: id ?? this.id,
    spearheadId: spearheadId ?? this.spearheadId,
    name: name ?? this.name,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    move: move ?? this.move,
    health: health ?? this.health,
    save: save ?? this.save,
    ward: ward.present ? ward.value : this.ward,
    control: control ?? this.control,
    isGeneral: isGeneral ?? this.isGeneral,
  );
  Warscroll copyWithCompanion(WarscrollsCompanion data) {
    return Warscroll(
      id: data.id.present ? data.id.value : this.id,
      spearheadId: data.spearheadId.present
          ? data.spearheadId.value
          : this.spearheadId,
      name: data.name.present ? data.name.value : this.name,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      move: data.move.present ? data.move.value : this.move,
      health: data.health.present ? data.health.value : this.health,
      save: data.save.present ? data.save.value : this.save,
      ward: data.ward.present ? data.ward.value : this.ward,
      control: data.control.present ? data.control.value : this.control,
      isGeneral: data.isGeneral.present ? data.isGeneral.value : this.isGeneral,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Warscroll(')
          ..write('id: $id, ')
          ..write('spearheadId: $spearheadId, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('move: $move, ')
          ..write('health: $health, ')
          ..write('save: $save, ')
          ..write('ward: $ward, ')
          ..write('control: $control, ')
          ..write('isGeneral: $isGeneral')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    spearheadId,
    name,
    imagePath,
    move,
    health,
    save,
    ward,
    control,
    isGeneral,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Warscroll &&
          other.id == this.id &&
          other.spearheadId == this.spearheadId &&
          other.name == this.name &&
          other.imagePath == this.imagePath &&
          other.move == this.move &&
          other.health == this.health &&
          other.save == this.save &&
          other.ward == this.ward &&
          other.control == this.control &&
          other.isGeneral == this.isGeneral);
}

class WarscrollsCompanion extends UpdateCompanion<Warscroll> {
  final Value<int> id;
  final Value<int> spearheadId;
  final Value<String> name;
  final Value<String?> imagePath;
  final Value<int> move;
  final Value<int> health;
  final Value<int> save;
  final Value<int?> ward;
  final Value<int> control;
  final Value<bool> isGeneral;
  const WarscrollsCompanion({
    this.id = const Value.absent(),
    this.spearheadId = const Value.absent(),
    this.name = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.move = const Value.absent(),
    this.health = const Value.absent(),
    this.save = const Value.absent(),
    this.ward = const Value.absent(),
    this.control = const Value.absent(),
    this.isGeneral = const Value.absent(),
  });
  WarscrollsCompanion.insert({
    this.id = const Value.absent(),
    required int spearheadId,
    required String name,
    this.imagePath = const Value.absent(),
    required int move,
    required int health,
    required int save,
    this.ward = const Value.absent(),
    this.control = const Value.absent(),
    required bool isGeneral,
  }) : spearheadId = Value(spearheadId),
       name = Value(name),
       move = Value(move),
       health = Value(health),
       save = Value(save),
       isGeneral = Value(isGeneral);
  static Insertable<Warscroll> custom({
    Expression<int>? id,
    Expression<int>? spearheadId,
    Expression<String>? name,
    Expression<String>? imagePath,
    Expression<int>? move,
    Expression<int>? health,
    Expression<int>? save,
    Expression<int>? ward,
    Expression<int>? control,
    Expression<bool>? isGeneral,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (spearheadId != null) 'spearhead_id': spearheadId,
      if (name != null) 'name': name,
      if (imagePath != null) 'image_path': imagePath,
      if (move != null) 'move': move,
      if (health != null) 'health': health,
      if (save != null) 'save': save,
      if (ward != null) 'ward': ward,
      if (control != null) 'control': control,
      if (isGeneral != null) 'is_general': isGeneral,
    });
  }

  WarscrollsCompanion copyWith({
    Value<int>? id,
    Value<int>? spearheadId,
    Value<String>? name,
    Value<String?>? imagePath,
    Value<int>? move,
    Value<int>? health,
    Value<int>? save,
    Value<int?>? ward,
    Value<int>? control,
    Value<bool>? isGeneral,
  }) {
    return WarscrollsCompanion(
      id: id ?? this.id,
      spearheadId: spearheadId ?? this.spearheadId,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      move: move ?? this.move,
      health: health ?? this.health,
      save: save ?? this.save,
      ward: ward ?? this.ward,
      control: control ?? this.control,
      isGeneral: isGeneral ?? this.isGeneral,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (spearheadId.present) {
      map['spearhead_id'] = Variable<int>(spearheadId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (move.present) {
      map['move'] = Variable<int>(move.value);
    }
    if (health.present) {
      map['health'] = Variable<int>(health.value);
    }
    if (save.present) {
      map['save'] = Variable<int>(save.value);
    }
    if (ward.present) {
      map['ward'] = Variable<int>(ward.value);
    }
    if (control.present) {
      map['control'] = Variable<int>(control.value);
    }
    if (isGeneral.present) {
      map['is_general'] = Variable<bool>(isGeneral.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WarscrollsCompanion(')
          ..write('id: $id, ')
          ..write('spearheadId: $spearheadId, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('move: $move, ')
          ..write('health: $health, ')
          ..write('save: $save, ')
          ..write('ward: $ward, ')
          ..write('control: $control, ')
          ..write('isGeneral: $isGeneral')
          ..write(')'))
        .toString();
  }
}

class WarscrollKeywords extends Table
    with TableInfo<WarscrollKeywords, WarscrollKeyword> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  WarscrollKeywords(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _warscrollIdMeta = const VerificationMeta(
    'warscrollId',
  );
  late final GeneratedColumn<int> warscrollId = GeneratedColumn<int>(
    'warscroll_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES warscrolls(id)',
  );
  static const VerificationMeta _keywordIdMeta = const VerificationMeta(
    'keywordId',
  );
  late final GeneratedColumn<int> keywordId = GeneratedColumn<int>(
    'keyword_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES keywords(id)',
  );
  @override
  List<GeneratedColumn> get $columns => [warscrollId, keywordId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'warscroll_keywords';
  @override
  VerificationContext validateIntegrity(
    Insertable<WarscrollKeyword> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('warscroll_id')) {
      context.handle(
        _warscrollIdMeta,
        warscrollId.isAcceptableOrUnknown(
          data['warscroll_id']!,
          _warscrollIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_warscrollIdMeta);
    }
    if (data.containsKey('keyword_id')) {
      context.handle(
        _keywordIdMeta,
        keywordId.isAcceptableOrUnknown(data['keyword_id']!, _keywordIdMeta),
      );
    } else if (isInserting) {
      context.missing(_keywordIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {warscrollId, keywordId};
  @override
  WarscrollKeyword map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WarscrollKeyword(
      warscrollId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}warscroll_id'],
      )!,
      keywordId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}keyword_id'],
      )!,
    );
  }

  @override
  WarscrollKeywords createAlias(String alias) {
    return WarscrollKeywords(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(warscroll_id, keyword_id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class WarscrollKeyword extends DataClass
    implements Insertable<WarscrollKeyword> {
  final int warscrollId;
  final int keywordId;
  const WarscrollKeyword({required this.warscrollId, required this.keywordId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['warscroll_id'] = Variable<int>(warscrollId);
    map['keyword_id'] = Variable<int>(keywordId);
    return map;
  }

  WarscrollKeywordsCompanion toCompanion(bool nullToAbsent) {
    return WarscrollKeywordsCompanion(
      warscrollId: Value(warscrollId),
      keywordId: Value(keywordId),
    );
  }

  factory WarscrollKeyword.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WarscrollKeyword(
      warscrollId: serializer.fromJson<int>(json['warscroll_id']),
      keywordId: serializer.fromJson<int>(json['keyword_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'warscroll_id': serializer.toJson<int>(warscrollId),
      'keyword_id': serializer.toJson<int>(keywordId),
    };
  }

  WarscrollKeyword copyWith({int? warscrollId, int? keywordId}) =>
      WarscrollKeyword(
        warscrollId: warscrollId ?? this.warscrollId,
        keywordId: keywordId ?? this.keywordId,
      );
  WarscrollKeyword copyWithCompanion(WarscrollKeywordsCompanion data) {
    return WarscrollKeyword(
      warscrollId: data.warscrollId.present
          ? data.warscrollId.value
          : this.warscrollId,
      keywordId: data.keywordId.present ? data.keywordId.value : this.keywordId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WarscrollKeyword(')
          ..write('warscrollId: $warscrollId, ')
          ..write('keywordId: $keywordId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(warscrollId, keywordId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WarscrollKeyword &&
          other.warscrollId == this.warscrollId &&
          other.keywordId == this.keywordId);
}

class WarscrollKeywordsCompanion extends UpdateCompanion<WarscrollKeyword> {
  final Value<int> warscrollId;
  final Value<int> keywordId;
  const WarscrollKeywordsCompanion({
    this.warscrollId = const Value.absent(),
    this.keywordId = const Value.absent(),
  });
  WarscrollKeywordsCompanion.insert({
    required int warscrollId,
    required int keywordId,
  }) : warscrollId = Value(warscrollId),
       keywordId = Value(keywordId);
  static Insertable<WarscrollKeyword> custom({
    Expression<int>? warscrollId,
    Expression<int>? keywordId,
  }) {
    return RawValuesInsertable({
      if (warscrollId != null) 'warscroll_id': warscrollId,
      if (keywordId != null) 'keyword_id': keywordId,
    });
  }

  WarscrollKeywordsCompanion copyWith({
    Value<int>? warscrollId,
    Value<int>? keywordId,
  }) {
    return WarscrollKeywordsCompanion(
      warscrollId: warscrollId ?? this.warscrollId,
      keywordId: keywordId ?? this.keywordId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (warscrollId.present) {
      map['warscroll_id'] = Variable<int>(warscrollId.value);
    }
    if (keywordId.present) {
      map['keyword_id'] = Variable<int>(keywordId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WarscrollKeywordsCompanion(')
          ..write('warscrollId: $warscrollId, ')
          ..write('keywordId: $keywordId')
          ..write(')'))
        .toString();
  }
}

class Weapons extends Table with TableInfo<Weapons, Weapon> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Weapons(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _warscrollIdMeta = const VerificationMeta(
    'warscrollId',
  );
  late final GeneratedColumn<int> warscrollId = GeneratedColumn<int>(
    'warscroll_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES warscrolls(id)',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _attacksMeta = const VerificationMeta(
    'attacks',
  );
  late final GeneratedColumn<String> attacks = GeneratedColumn<String>(
    'attacks',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _hitMeta = const VerificationMeta('hit');
  late final GeneratedColumn<int> hit = GeneratedColumn<int>(
    'hit',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _woundMeta = const VerificationMeta('wound');
  late final GeneratedColumn<int> wound = GeneratedColumn<int>(
    'wound',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _rendMeta = const VerificationMeta('rend');
  late final GeneratedColumn<int> rend = GeneratedColumn<int>(
    'rend',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  static const VerificationMeta _damageMeta = const VerificationMeta('damage');
  late final GeneratedColumn<String> damage = GeneratedColumn<String>(
    'damage',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _specialRuleMeta = const VerificationMeta(
    'specialRule',
  );
  late final GeneratedColumn<String> specialRule = GeneratedColumn<String>(
    'special_rule',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    warscrollId,
    name,
    attacks,
    hit,
    wound,
    rend,
    damage,
    specialRule,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weapons';
  @override
  VerificationContext validateIntegrity(
    Insertable<Weapon> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('warscroll_id')) {
      context.handle(
        _warscrollIdMeta,
        warscrollId.isAcceptableOrUnknown(
          data['warscroll_id']!,
          _warscrollIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_warscrollIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('attacks')) {
      context.handle(
        _attacksMeta,
        attacks.isAcceptableOrUnknown(data['attacks']!, _attacksMeta),
      );
    } else if (isInserting) {
      context.missing(_attacksMeta);
    }
    if (data.containsKey('hit')) {
      context.handle(
        _hitMeta,
        hit.isAcceptableOrUnknown(data['hit']!, _hitMeta),
      );
    } else if (isInserting) {
      context.missing(_hitMeta);
    }
    if (data.containsKey('wound')) {
      context.handle(
        _woundMeta,
        wound.isAcceptableOrUnknown(data['wound']!, _woundMeta),
      );
    } else if (isInserting) {
      context.missing(_woundMeta);
    }
    if (data.containsKey('rend')) {
      context.handle(
        _rendMeta,
        rend.isAcceptableOrUnknown(data['rend']!, _rendMeta),
      );
    }
    if (data.containsKey('damage')) {
      context.handle(
        _damageMeta,
        damage.isAcceptableOrUnknown(data['damage']!, _damageMeta),
      );
    } else if (isInserting) {
      context.missing(_damageMeta);
    }
    if (data.containsKey('special_rule')) {
      context.handle(
        _specialRuleMeta,
        specialRule.isAcceptableOrUnknown(
          data['special_rule']!,
          _specialRuleMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {warscrollId, name};
  @override
  Weapon map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Weapon(
      warscrollId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}warscroll_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      attacks: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attacks'],
      )!,
      hit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hit'],
      )!,
      wound: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wound'],
      )!,
      rend: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rend'],
      )!,
      damage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}damage'],
      )!,
      specialRule: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}special_rule'],
      ),
    );
  }

  @override
  Weapons createAlias(String alias) {
    return Weapons(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(warscroll_id, name)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class Weapon extends DataClass implements Insertable<Weapon> {
  final int warscrollId;
  final String name;

  /// 0 for melee, 1+ for ranged
  final String attacks;

  /// can be dice e.g. '2D6' or fixed '3'
  final int hit;

  /// e.g. 3 means 3+
  final int wound;

  /// e.g. 4 means 4+
  final int rend;
  final String damage;

  /// '1', '2', 'D3', 'D6' …
  final String? specialRule;
  const Weapon({
    required this.warscrollId,
    required this.name,
    required this.attacks,
    required this.hit,
    required this.wound,
    required this.rend,
    required this.damage,
    this.specialRule,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['warscroll_id'] = Variable<int>(warscrollId);
    map['name'] = Variable<String>(name);
    map['attacks'] = Variable<String>(attacks);
    map['hit'] = Variable<int>(hit);
    map['wound'] = Variable<int>(wound);
    map['rend'] = Variable<int>(rend);
    map['damage'] = Variable<String>(damage);
    if (!nullToAbsent || specialRule != null) {
      map['special_rule'] = Variable<String>(specialRule);
    }
    return map;
  }

  WeaponsCompanion toCompanion(bool nullToAbsent) {
    return WeaponsCompanion(
      warscrollId: Value(warscrollId),
      name: Value(name),
      attacks: Value(attacks),
      hit: Value(hit),
      wound: Value(wound),
      rend: Value(rend),
      damage: Value(damage),
      specialRule: specialRule == null && nullToAbsent
          ? const Value.absent()
          : Value(specialRule),
    );
  }

  factory Weapon.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Weapon(
      warscrollId: serializer.fromJson<int>(json['warscroll_id']),
      name: serializer.fromJson<String>(json['name']),
      attacks: serializer.fromJson<String>(json['attacks']),
      hit: serializer.fromJson<int>(json['hit']),
      wound: serializer.fromJson<int>(json['wound']),
      rend: serializer.fromJson<int>(json['rend']),
      damage: serializer.fromJson<String>(json['damage']),
      specialRule: serializer.fromJson<String?>(json['special_rule']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'warscroll_id': serializer.toJson<int>(warscrollId),
      'name': serializer.toJson<String>(name),
      'attacks': serializer.toJson<String>(attacks),
      'hit': serializer.toJson<int>(hit),
      'wound': serializer.toJson<int>(wound),
      'rend': serializer.toJson<int>(rend),
      'damage': serializer.toJson<String>(damage),
      'special_rule': serializer.toJson<String?>(specialRule),
    };
  }

  Weapon copyWith({
    int? warscrollId,
    String? name,
    String? attacks,
    int? hit,
    int? wound,
    int? rend,
    String? damage,
    Value<String?> specialRule = const Value.absent(),
  }) => Weapon(
    warscrollId: warscrollId ?? this.warscrollId,
    name: name ?? this.name,
    attacks: attacks ?? this.attacks,
    hit: hit ?? this.hit,
    wound: wound ?? this.wound,
    rend: rend ?? this.rend,
    damage: damage ?? this.damage,
    specialRule: specialRule.present ? specialRule.value : this.specialRule,
  );
  Weapon copyWithCompanion(WeaponsCompanion data) {
    return Weapon(
      warscrollId: data.warscrollId.present
          ? data.warscrollId.value
          : this.warscrollId,
      name: data.name.present ? data.name.value : this.name,
      attacks: data.attacks.present ? data.attacks.value : this.attacks,
      hit: data.hit.present ? data.hit.value : this.hit,
      wound: data.wound.present ? data.wound.value : this.wound,
      rend: data.rend.present ? data.rend.value : this.rend,
      damage: data.damage.present ? data.damage.value : this.damage,
      specialRule: data.specialRule.present
          ? data.specialRule.value
          : this.specialRule,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Weapon(')
          ..write('warscrollId: $warscrollId, ')
          ..write('name: $name, ')
          ..write('attacks: $attacks, ')
          ..write('hit: $hit, ')
          ..write('wound: $wound, ')
          ..write('rend: $rend, ')
          ..write('damage: $damage, ')
          ..write('specialRule: $specialRule')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    warscrollId,
    name,
    attacks,
    hit,
    wound,
    rend,
    damage,
    specialRule,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Weapon &&
          other.warscrollId == this.warscrollId &&
          other.name == this.name &&
          other.attacks == this.attacks &&
          other.hit == this.hit &&
          other.wound == this.wound &&
          other.rend == this.rend &&
          other.damage == this.damage &&
          other.specialRule == this.specialRule);
}

class WeaponsCompanion extends UpdateCompanion<Weapon> {
  final Value<int> warscrollId;
  final Value<String> name;
  final Value<String> attacks;
  final Value<int> hit;
  final Value<int> wound;
  final Value<int> rend;
  final Value<String> damage;
  final Value<String?> specialRule;
  const WeaponsCompanion({
    this.warscrollId = const Value.absent(),
    this.name = const Value.absent(),
    this.attacks = const Value.absent(),
    this.hit = const Value.absent(),
    this.wound = const Value.absent(),
    this.rend = const Value.absent(),
    this.damage = const Value.absent(),
    this.specialRule = const Value.absent(),
  });
  WeaponsCompanion.insert({
    required int warscrollId,
    required String name,
    required String attacks,
    required int hit,
    required int wound,
    this.rend = const Value.absent(),
    required String damage,
    this.specialRule = const Value.absent(),
  }) : warscrollId = Value(warscrollId),
       name = Value(name),
       attacks = Value(attacks),
       hit = Value(hit),
       wound = Value(wound),
       damage = Value(damage);
  static Insertable<Weapon> custom({
    Expression<int>? warscrollId,
    Expression<String>? name,
    Expression<String>? attacks,
    Expression<int>? hit,
    Expression<int>? wound,
    Expression<int>? rend,
    Expression<String>? damage,
    Expression<String>? specialRule,
  }) {
    return RawValuesInsertable({
      if (warscrollId != null) 'warscroll_id': warscrollId,
      if (name != null) 'name': name,
      if (attacks != null) 'attacks': attacks,
      if (hit != null) 'hit': hit,
      if (wound != null) 'wound': wound,
      if (rend != null) 'rend': rend,
      if (damage != null) 'damage': damage,
      if (specialRule != null) 'special_rule': specialRule,
    });
  }

  WeaponsCompanion copyWith({
    Value<int>? warscrollId,
    Value<String>? name,
    Value<String>? attacks,
    Value<int>? hit,
    Value<int>? wound,
    Value<int>? rend,
    Value<String>? damage,
    Value<String?>? specialRule,
  }) {
    return WeaponsCompanion(
      warscrollId: warscrollId ?? this.warscrollId,
      name: name ?? this.name,
      attacks: attacks ?? this.attacks,
      hit: hit ?? this.hit,
      wound: wound ?? this.wound,
      rend: rend ?? this.rend,
      damage: damage ?? this.damage,
      specialRule: specialRule ?? this.specialRule,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (warscrollId.present) {
      map['warscroll_id'] = Variable<int>(warscrollId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (attacks.present) {
      map['attacks'] = Variable<String>(attacks.value);
    }
    if (hit.present) {
      map['hit'] = Variable<int>(hit.value);
    }
    if (wound.present) {
      map['wound'] = Variable<int>(wound.value);
    }
    if (rend.present) {
      map['rend'] = Variable<int>(rend.value);
    }
    if (damage.present) {
      map['damage'] = Variable<String>(damage.value);
    }
    if (specialRule.present) {
      map['special_rule'] = Variable<String>(specialRule.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeaponsCompanion(')
          ..write('warscrollId: $warscrollId, ')
          ..write('name: $name, ')
          ..write('attacks: $attacks, ')
          ..write('hit: $hit, ')
          ..write('wound: $wound, ')
          ..write('rend: $rend, ')
          ..write('damage: $damage, ')
          ..write('specialRule: $specialRule')
          ..write(')'))
        .toString();
  }
}

class Abilities extends Table with TableInfo<Abilities, Ability> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Abilities(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (type IN (\'passive\', \'once per turn\', \'once per battle\', \'reaction\', \'once per round\'))',
  );
  static const VerificationMeta _timingMeta = const VerificationMeta('timing');
  late final GeneratedColumn<String> timing = GeneratedColumn<String>(
    'timing',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, type, timing, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'abilities';
  @override
  VerificationContext validateIntegrity(
    Insertable<Ability> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('timing')) {
      context.handle(
        _timingMeta,
        timing.isAcceptableOrUnknown(data['timing']!, _timingMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ability map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ability(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      timing: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timing'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
    );
  }

  @override
  Abilities createAlias(String alias) {
    return Abilities(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Ability extends DataClass implements Insertable<Ability> {
  final int id;
  final String name;
  final String type;
  final String? timing;

  /// 'Start of Turn', 'Combat Phase', etc.
  final String description;
  const Ability({
    required this.id,
    required this.name,
    required this.type,
    this.timing,
    required this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || timing != null) {
      map['timing'] = Variable<String>(timing);
    }
    map['description'] = Variable<String>(description);
    return map;
  }

  AbilitiesCompanion toCompanion(bool nullToAbsent) {
    return AbilitiesCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      timing: timing == null && nullToAbsent
          ? const Value.absent()
          : Value(timing),
      description: Value(description),
    );
  }

  factory Ability.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ability(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      timing: serializer.fromJson<String?>(json['timing']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'timing': serializer.toJson<String?>(timing),
      'description': serializer.toJson<String>(description),
    };
  }

  Ability copyWith({
    int? id,
    String? name,
    String? type,
    Value<String?> timing = const Value.absent(),
    String? description,
  }) => Ability(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    timing: timing.present ? timing.value : this.timing,
    description: description ?? this.description,
  );
  Ability copyWithCompanion(AbilitiesCompanion data) {
    return Ability(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      timing: data.timing.present ? data.timing.value : this.timing,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ability(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('timing: $timing, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type, timing, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ability &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.timing == this.timing &&
          other.description == this.description);
}

class AbilitiesCompanion extends UpdateCompanion<Ability> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> type;
  final Value<String?> timing;
  final Value<String> description;
  const AbilitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.timing = const Value.absent(),
    this.description = const Value.absent(),
  });
  AbilitiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String type,
    this.timing = const Value.absent(),
    required String description,
  }) : name = Value(name),
       type = Value(type),
       description = Value(description);
  static Insertable<Ability> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? timing,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (timing != null) 'timing': timing,
      if (description != null) 'description': description,
    });
  }

  AbilitiesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? type,
    Value<String?>? timing,
    Value<String>? description,
  }) {
    return AbilitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      timing: timing ?? this.timing,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (timing.present) {
      map['timing'] = Variable<String>(timing.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AbilitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('timing: $timing, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class WarscrollAbilities extends Table
    with TableInfo<WarscrollAbilities, WarscrollAbility> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  WarscrollAbilities(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _warscrollIdMeta = const VerificationMeta(
    'warscrollId',
  );
  late final GeneratedColumn<int> warscrollId = GeneratedColumn<int>(
    'warscroll_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES warscrolls(id)',
  );
  static const VerificationMeta _abilityIdMeta = const VerificationMeta(
    'abilityId',
  );
  late final GeneratedColumn<int> abilityId = GeneratedColumn<int>(
    'ability_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES abilities(id)',
  );
  @override
  List<GeneratedColumn> get $columns => [warscrollId, abilityId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'warscroll_abilities';
  @override
  VerificationContext validateIntegrity(
    Insertable<WarscrollAbility> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('warscroll_id')) {
      context.handle(
        _warscrollIdMeta,
        warscrollId.isAcceptableOrUnknown(
          data['warscroll_id']!,
          _warscrollIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_warscrollIdMeta);
    }
    if (data.containsKey('ability_id')) {
      context.handle(
        _abilityIdMeta,
        abilityId.isAcceptableOrUnknown(data['ability_id']!, _abilityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_abilityIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {warscrollId, abilityId};
  @override
  WarscrollAbility map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WarscrollAbility(
      warscrollId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}warscroll_id'],
      )!,
      abilityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ability_id'],
      )!,
    );
  }

  @override
  WarscrollAbilities createAlias(String alias) {
    return WarscrollAbilities(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(warscroll_id, ability_id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class WarscrollAbility extends DataClass
    implements Insertable<WarscrollAbility> {
  final int warscrollId;
  final int abilityId;
  const WarscrollAbility({required this.warscrollId, required this.abilityId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['warscroll_id'] = Variable<int>(warscrollId);
    map['ability_id'] = Variable<int>(abilityId);
    return map;
  }

  WarscrollAbilitiesCompanion toCompanion(bool nullToAbsent) {
    return WarscrollAbilitiesCompanion(
      warscrollId: Value(warscrollId),
      abilityId: Value(abilityId),
    );
  }

  factory WarscrollAbility.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WarscrollAbility(
      warscrollId: serializer.fromJson<int>(json['warscroll_id']),
      abilityId: serializer.fromJson<int>(json['ability_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'warscroll_id': serializer.toJson<int>(warscrollId),
      'ability_id': serializer.toJson<int>(abilityId),
    };
  }

  WarscrollAbility copyWith({int? warscrollId, int? abilityId}) =>
      WarscrollAbility(
        warscrollId: warscrollId ?? this.warscrollId,
        abilityId: abilityId ?? this.abilityId,
      );
  WarscrollAbility copyWithCompanion(WarscrollAbilitiesCompanion data) {
    return WarscrollAbility(
      warscrollId: data.warscrollId.present
          ? data.warscrollId.value
          : this.warscrollId,
      abilityId: data.abilityId.present ? data.abilityId.value : this.abilityId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WarscrollAbility(')
          ..write('warscrollId: $warscrollId, ')
          ..write('abilityId: $abilityId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(warscrollId, abilityId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WarscrollAbility &&
          other.warscrollId == this.warscrollId &&
          other.abilityId == this.abilityId);
}

class WarscrollAbilitiesCompanion extends UpdateCompanion<WarscrollAbility> {
  final Value<int> warscrollId;
  final Value<int> abilityId;
  const WarscrollAbilitiesCompanion({
    this.warscrollId = const Value.absent(),
    this.abilityId = const Value.absent(),
  });
  WarscrollAbilitiesCompanion.insert({
    required int warscrollId,
    required int abilityId,
  }) : warscrollId = Value(warscrollId),
       abilityId = Value(abilityId);
  static Insertable<WarscrollAbility> custom({
    Expression<int>? warscrollId,
    Expression<int>? abilityId,
  }) {
    return RawValuesInsertable({
      if (warscrollId != null) 'warscroll_id': warscrollId,
      if (abilityId != null) 'ability_id': abilityId,
    });
  }

  WarscrollAbilitiesCompanion copyWith({
    Value<int>? warscrollId,
    Value<int>? abilityId,
  }) {
    return WarscrollAbilitiesCompanion(
      warscrollId: warscrollId ?? this.warscrollId,
      abilityId: abilityId ?? this.abilityId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (warscrollId.present) {
      map['warscroll_id'] = Variable<int>(warscrollId.value);
    }
    if (abilityId.present) {
      map['ability_id'] = Variable<int>(abilityId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WarscrollAbilitiesCompanion(')
          ..write('warscrollId: $warscrollId, ')
          ..write('abilityId: $abilityId')
          ..write(')'))
        .toString();
  }
}

class SpearheadAbilities extends Table
    with TableInfo<SpearheadAbilities, SpearheadAbility> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  SpearheadAbilities(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _spearheadIdMeta = const VerificationMeta(
    'spearheadId',
  );
  late final GeneratedColumn<int> spearheadId = GeneratedColumn<int>(
    'spearhead_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES spearheads(id)',
  );
  static const VerificationMeta _abilityIdMeta = const VerificationMeta(
    'abilityId',
  );
  late final GeneratedColumn<int> abilityId = GeneratedColumn<int>(
    'ability_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES abilities(id)',
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (type IN (\'battle trait\', \'regiment ability\', \'enhancement\'))',
  );
  @override
  List<GeneratedColumn> get $columns => [spearheadId, abilityId, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'spearhead_abilities';
  @override
  VerificationContext validateIntegrity(
    Insertable<SpearheadAbility> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('spearhead_id')) {
      context.handle(
        _spearheadIdMeta,
        spearheadId.isAcceptableOrUnknown(
          data['spearhead_id']!,
          _spearheadIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_spearheadIdMeta);
    }
    if (data.containsKey('ability_id')) {
      context.handle(
        _abilityIdMeta,
        abilityId.isAcceptableOrUnknown(data['ability_id']!, _abilityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_abilityIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {spearheadId, abilityId};
  @override
  SpearheadAbility map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SpearheadAbility(
      spearheadId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}spearhead_id'],
      )!,
      abilityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ability_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
    );
  }

  @override
  SpearheadAbilities createAlias(String alias) {
    return SpearheadAbilities(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(spearhead_id, ability_id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class SpearheadAbility extends DataClass
    implements Insertable<SpearheadAbility> {
  final int spearheadId;
  final int abilityId;
  final String type;
  const SpearheadAbility({
    required this.spearheadId,
    required this.abilityId,
    required this.type,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['spearhead_id'] = Variable<int>(spearheadId);
    map['ability_id'] = Variable<int>(abilityId);
    map['type'] = Variable<String>(type);
    return map;
  }

  SpearheadAbilitiesCompanion toCompanion(bool nullToAbsent) {
    return SpearheadAbilitiesCompanion(
      spearheadId: Value(spearheadId),
      abilityId: Value(abilityId),
      type: Value(type),
    );
  }

  factory SpearheadAbility.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SpearheadAbility(
      spearheadId: serializer.fromJson<int>(json['spearhead_id']),
      abilityId: serializer.fromJson<int>(json['ability_id']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'spearhead_id': serializer.toJson<int>(spearheadId),
      'ability_id': serializer.toJson<int>(abilityId),
      'type': serializer.toJson<String>(type),
    };
  }

  SpearheadAbility copyWith({int? spearheadId, int? abilityId, String? type}) =>
      SpearheadAbility(
        spearheadId: spearheadId ?? this.spearheadId,
        abilityId: abilityId ?? this.abilityId,
        type: type ?? this.type,
      );
  SpearheadAbility copyWithCompanion(SpearheadAbilitiesCompanion data) {
    return SpearheadAbility(
      spearheadId: data.spearheadId.present
          ? data.spearheadId.value
          : this.spearheadId,
      abilityId: data.abilityId.present ? data.abilityId.value : this.abilityId,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SpearheadAbility(')
          ..write('spearheadId: $spearheadId, ')
          ..write('abilityId: $abilityId, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(spearheadId, abilityId, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SpearheadAbility &&
          other.spearheadId == this.spearheadId &&
          other.abilityId == this.abilityId &&
          other.type == this.type);
}

class SpearheadAbilitiesCompanion extends UpdateCompanion<SpearheadAbility> {
  final Value<int> spearheadId;
  final Value<int> abilityId;
  final Value<String> type;
  const SpearheadAbilitiesCompanion({
    this.spearheadId = const Value.absent(),
    this.abilityId = const Value.absent(),
    this.type = const Value.absent(),
  });
  SpearheadAbilitiesCompanion.insert({
    required int spearheadId,
    required int abilityId,
    required String type,
  }) : spearheadId = Value(spearheadId),
       abilityId = Value(abilityId),
       type = Value(type);
  static Insertable<SpearheadAbility> custom({
    Expression<int>? spearheadId,
    Expression<int>? abilityId,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (spearheadId != null) 'spearhead_id': spearheadId,
      if (abilityId != null) 'ability_id': abilityId,
      if (type != null) 'type': type,
    });
  }

  SpearheadAbilitiesCompanion copyWith({
    Value<int>? spearheadId,
    Value<int>? abilityId,
    Value<String>? type,
  }) {
    return SpearheadAbilitiesCompanion(
      spearheadId: spearheadId ?? this.spearheadId,
      abilityId: abilityId ?? this.abilityId,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (spearheadId.present) {
      map['spearhead_id'] = Variable<int>(spearheadId.value);
    }
    if (abilityId.present) {
      map['ability_id'] = Variable<int>(abilityId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpearheadAbilitiesCompanion(')
          ..write('spearheadId: $spearheadId, ')
          ..write('abilityId: $abilityId, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

abstract class _$WarhammerDatabase extends GeneratedDatabase {
  _$WarhammerDatabase(QueryExecutor e) : super(e);
  $WarhammerDatabaseManager get managers => $WarhammerDatabaseManager(this);
  late final Armies armies = Armies(this);
  late final Spearheads spearheads = Spearheads(this);
  late final Keywords keywords = Keywords(this);
  late final Warscrolls warscrolls = Warscrolls(this);
  late final WarscrollKeywords warscrollKeywords = WarscrollKeywords(this);
  late final Weapons weapons = Weapons(this);
  late final Abilities abilities = Abilities(this);
  late final WarscrollAbilities warscrollAbilities = WarscrollAbilities(this);
  late final SpearheadAbilities spearheadAbilities = SpearheadAbilities(this);
  Selectable<SearchSpearheadsResult> searchSpearheads(String query) {
    return customSelect(
      'SELECT"s"."id" AS "nested_0.id", "s"."army_id" AS "nested_0.army_id", "s"."name" AS "nested_0.name", a.name AS army_name FROM spearheads AS s INNER JOIN armies AS a ON a.id = s.army_id WHERE s.name LIKE ?1 OR a.name LIKE ?1',
      variables: [Variable<String>(query)],
      readsFrom: {armies, spearheads},
    ).asyncMap(
      (QueryRow row) async => SearchSpearheadsResult(
        s: await spearheads.mapFromRow(row, tablePrefix: 'nested_0'),
        armyName: row.read<String>('army_name'),
      ),
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    armies,
    spearheads,
    keywords,
    warscrolls,
    warscrollKeywords,
    weapons,
    abilities,
    warscrollAbilities,
    spearheadAbilities,
  ];
}

typedef $ArmiesCreateCompanionBuilder =
    ArmiesCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> imagePath,
    });
typedef $ArmiesUpdateCompanionBuilder =
    ArmiesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> imagePath,
    });

final class $ArmiesReferences
    extends BaseReferences<_$WarhammerDatabase, Armies, Army> {
  $ArmiesReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<Spearheads, List<Spearhead>> _spearheadsRefsTable(
    _$WarhammerDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.spearheads,
    aliasName: $_aliasNameGenerator(db.armies.id, db.spearheads.armyId),
  );

  $SpearheadsProcessedTableManager get spearheadsRefs {
    final manager = $SpearheadsTableManager(
      $_db,
      $_db.spearheads,
    ).filter((f) => f.armyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_spearheadsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $ArmiesFilterComposer extends Composer<_$WarhammerDatabase, Armies> {
  $ArmiesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> spearheadsRefs(
    Expression<bool> Function($SpearheadsFilterComposer f) f,
  ) {
    final $SpearheadsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.spearheads,
      getReferencedColumn: (t) => t.armyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $SpearheadsFilterComposer(
            $db: $db,
            $table: $db.spearheads,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $ArmiesOrderingComposer extends Composer<_$WarhammerDatabase, Armies> {
  $ArmiesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $ArmiesAnnotationComposer extends Composer<_$WarhammerDatabase, Armies> {
  $ArmiesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  Expression<T> spearheadsRefs<T extends Object>(
    Expression<T> Function($SpearheadsAnnotationComposer a) f,
  ) {
    final $SpearheadsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.spearheads,
      getReferencedColumn: (t) => t.armyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $SpearheadsAnnotationComposer(
            $db: $db,
            $table: $db.spearheads,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $ArmiesTableManager
    extends
        RootTableManager<
          _$WarhammerDatabase,
          Armies,
          Army,
          $ArmiesFilterComposer,
          $ArmiesOrderingComposer,
          $ArmiesAnnotationComposer,
          $ArmiesCreateCompanionBuilder,
          $ArmiesUpdateCompanionBuilder,
          (Army, $ArmiesReferences),
          Army,
          PrefetchHooks Function({bool spearheadsRefs})
        > {
  $ArmiesTableManager(_$WarhammerDatabase db, Armies table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $ArmiesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $ArmiesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $ArmiesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
              }) => ArmiesCompanion(id: id, name: name, imagePath: imagePath),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> imagePath = const Value.absent(),
              }) => ArmiesCompanion.insert(
                id: id,
                name: name,
                imagePath: imagePath,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), $ArmiesReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({spearheadsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (spearheadsRefs) db.spearheads],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (spearheadsRefs)
                    await $_getPrefetchedData<Army, Armies, Spearhead>(
                      currentTable: table,
                      referencedTable: $ArmiesReferences._spearheadsRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $ArmiesReferences(db, table, p0).spearheadsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.armyId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $ArmiesProcessedTableManager =
    ProcessedTableManager<
      _$WarhammerDatabase,
      Armies,
      Army,
      $ArmiesFilterComposer,
      $ArmiesOrderingComposer,
      $ArmiesAnnotationComposer,
      $ArmiesCreateCompanionBuilder,
      $ArmiesUpdateCompanionBuilder,
      (Army, $ArmiesReferences),
      Army,
      PrefetchHooks Function({bool spearheadsRefs})
    >;
typedef $SpearheadsCreateCompanionBuilder =
    SpearheadsCompanion Function({
      Value<int> id,
      required int armyId,
      required String name,
    });
typedef $SpearheadsUpdateCompanionBuilder =
    SpearheadsCompanion Function({
      Value<int> id,
      Value<int> armyId,
      Value<String> name,
    });

final class $SpearheadsReferences
    extends BaseReferences<_$WarhammerDatabase, Spearheads, Spearhead> {
  $SpearheadsReferences(super.$_db, super.$_table, super.$_typedResult);

  static Armies _armyIdTable(_$WarhammerDatabase db) => db.armies.createAlias(
    $_aliasNameGenerator(db.spearheads.armyId, db.armies.id),
  );

  $ArmiesProcessedTableManager get armyId {
    final $_column = $_itemColumn<int>('army_id')!;

    final manager = $ArmiesTableManager(
      $_db,
      $_db.armies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_armyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<Warscrolls, List<Warscroll>> _warscrollsRefsTable(
    _$WarhammerDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.warscrolls,
    aliasName: $_aliasNameGenerator(
      db.spearheads.id,
      db.warscrolls.spearheadId,
    ),
  );

  $WarscrollsProcessedTableManager get warscrollsRefs {
    final manager = $WarscrollsTableManager(
      $_db,
      $_db.warscrolls,
    ).filter((f) => f.spearheadId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_warscrollsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<SpearheadAbilities, List<SpearheadAbility>>
  _spearheadAbilitiesRefsTable(_$WarhammerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.spearheadAbilities,
        aliasName: $_aliasNameGenerator(
          db.spearheads.id,
          db.spearheadAbilities.spearheadId,
        ),
      );

  $SpearheadAbilitiesProcessedTableManager get spearheadAbilitiesRefs {
    final manager = $SpearheadAbilitiesTableManager(
      $_db,
      $_db.spearheadAbilities,
    ).filter((f) => f.spearheadId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _spearheadAbilitiesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $SpearheadsFilterComposer
    extends Composer<_$WarhammerDatabase, Spearheads> {
  $SpearheadsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  $ArmiesFilterComposer get armyId {
    final $ArmiesFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.armyId,
      referencedTable: $db.armies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $ArmiesFilterComposer(
            $db: $db,
            $table: $db.armies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> warscrollsRefs(
    Expression<bool> Function($WarscrollsFilterComposer f) f,
  ) {
    final $WarscrollsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.warscrolls,
      getReferencedColumn: (t) => t.spearheadId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollsFilterComposer(
            $db: $db,
            $table: $db.warscrolls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> spearheadAbilitiesRefs(
    Expression<bool> Function($SpearheadAbilitiesFilterComposer f) f,
  ) {
    final $SpearheadAbilitiesFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.spearheadAbilities,
      getReferencedColumn: (t) => t.spearheadId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $SpearheadAbilitiesFilterComposer(
            $db: $db,
            $table: $db.spearheadAbilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $SpearheadsOrderingComposer
    extends Composer<_$WarhammerDatabase, Spearheads> {
  $SpearheadsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  $ArmiesOrderingComposer get armyId {
    final $ArmiesOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.armyId,
      referencedTable: $db.armies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $ArmiesOrderingComposer(
            $db: $db,
            $table: $db.armies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $SpearheadsAnnotationComposer
    extends Composer<_$WarhammerDatabase, Spearheads> {
  $SpearheadsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $ArmiesAnnotationComposer get armyId {
    final $ArmiesAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.armyId,
      referencedTable: $db.armies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $ArmiesAnnotationComposer(
            $db: $db,
            $table: $db.armies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> warscrollsRefs<T extends Object>(
    Expression<T> Function($WarscrollsAnnotationComposer a) f,
  ) {
    final $WarscrollsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.warscrolls,
      getReferencedColumn: (t) => t.spearheadId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollsAnnotationComposer(
            $db: $db,
            $table: $db.warscrolls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> spearheadAbilitiesRefs<T extends Object>(
    Expression<T> Function($SpearheadAbilitiesAnnotationComposer a) f,
  ) {
    final $SpearheadAbilitiesAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.spearheadAbilities,
      getReferencedColumn: (t) => t.spearheadId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $SpearheadAbilitiesAnnotationComposer(
            $db: $db,
            $table: $db.spearheadAbilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $SpearheadsTableManager
    extends
        RootTableManager<
          _$WarhammerDatabase,
          Spearheads,
          Spearhead,
          $SpearheadsFilterComposer,
          $SpearheadsOrderingComposer,
          $SpearheadsAnnotationComposer,
          $SpearheadsCreateCompanionBuilder,
          $SpearheadsUpdateCompanionBuilder,
          (Spearhead, $SpearheadsReferences),
          Spearhead,
          PrefetchHooks Function({
            bool armyId,
            bool warscrollsRefs,
            bool spearheadAbilitiesRefs,
          })
        > {
  $SpearheadsTableManager(_$WarhammerDatabase db, Spearheads table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $SpearheadsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $SpearheadsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $SpearheadsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> armyId = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => SpearheadsCompanion(id: id, armyId: armyId, name: name),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int armyId,
                required String name,
              }) => SpearheadsCompanion.insert(
                id: id,
                armyId: armyId,
                name: name,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $SpearheadsReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                armyId = false,
                warscrollsRefs = false,
                spearheadAbilitiesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (warscrollsRefs) db.warscrolls,
                    if (spearheadAbilitiesRefs) db.spearheadAbilities,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (armyId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.armyId,
                                    referencedTable: $SpearheadsReferences
                                        ._armyIdTable(db),
                                    referencedColumn: $SpearheadsReferences
                                        ._armyIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (warscrollsRefs)
                        await $_getPrefetchedData<
                          Spearhead,
                          Spearheads,
                          Warscroll
                        >(
                          currentTable: table,
                          referencedTable: $SpearheadsReferences
                              ._warscrollsRefsTable(db),
                          managerFromTypedResult: (p0) => $SpearheadsReferences(
                            db,
                            table,
                            p0,
                          ).warscrollsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.spearheadId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (spearheadAbilitiesRefs)
                        await $_getPrefetchedData<
                          Spearhead,
                          Spearheads,
                          SpearheadAbility
                        >(
                          currentTable: table,
                          referencedTable: $SpearheadsReferences
                              ._spearheadAbilitiesRefsTable(db),
                          managerFromTypedResult: (p0) => $SpearheadsReferences(
                            db,
                            table,
                            p0,
                          ).spearheadAbilitiesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.spearheadId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $SpearheadsProcessedTableManager =
    ProcessedTableManager<
      _$WarhammerDatabase,
      Spearheads,
      Spearhead,
      $SpearheadsFilterComposer,
      $SpearheadsOrderingComposer,
      $SpearheadsAnnotationComposer,
      $SpearheadsCreateCompanionBuilder,
      $SpearheadsUpdateCompanionBuilder,
      (Spearhead, $SpearheadsReferences),
      Spearhead,
      PrefetchHooks Function({
        bool armyId,
        bool warscrollsRefs,
        bool spearheadAbilitiesRefs,
      })
    >;
typedef $KeywordsCreateCompanionBuilder =
    KeywordsCompanion Function({Value<int> id, required String name});
typedef $KeywordsUpdateCompanionBuilder =
    KeywordsCompanion Function({Value<int> id, Value<String> name});

final class $KeywordsReferences
    extends BaseReferences<_$WarhammerDatabase, Keywords, Keyword> {
  $KeywordsReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<WarscrollKeywords, List<WarscrollKeyword>>
  _warscrollKeywordsRefsTable(_$WarhammerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.warscrollKeywords,
        aliasName: $_aliasNameGenerator(
          db.keywords.id,
          db.warscrollKeywords.keywordId,
        ),
      );

  $WarscrollKeywordsProcessedTableManager get warscrollKeywordsRefs {
    final manager = $WarscrollKeywordsTableManager(
      $_db,
      $_db.warscrollKeywords,
    ).filter((f) => f.keywordId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _warscrollKeywordsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $KeywordsFilterComposer extends Composer<_$WarhammerDatabase, Keywords> {
  $KeywordsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> warscrollKeywordsRefs(
    Expression<bool> Function($WarscrollKeywordsFilterComposer f) f,
  ) {
    final $WarscrollKeywordsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.warscrollKeywords,
      getReferencedColumn: (t) => t.keywordId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollKeywordsFilterComposer(
            $db: $db,
            $table: $db.warscrollKeywords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $KeywordsOrderingComposer
    extends Composer<_$WarhammerDatabase, Keywords> {
  $KeywordsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $KeywordsAnnotationComposer
    extends Composer<_$WarhammerDatabase, Keywords> {
  $KeywordsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> warscrollKeywordsRefs<T extends Object>(
    Expression<T> Function($WarscrollKeywordsAnnotationComposer a) f,
  ) {
    final $WarscrollKeywordsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.warscrollKeywords,
      getReferencedColumn: (t) => t.keywordId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollKeywordsAnnotationComposer(
            $db: $db,
            $table: $db.warscrollKeywords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $KeywordsTableManager
    extends
        RootTableManager<
          _$WarhammerDatabase,
          Keywords,
          Keyword,
          $KeywordsFilterComposer,
          $KeywordsOrderingComposer,
          $KeywordsAnnotationComposer,
          $KeywordsCreateCompanionBuilder,
          $KeywordsUpdateCompanionBuilder,
          (Keyword, $KeywordsReferences),
          Keyword,
          PrefetchHooks Function({bool warscrollKeywordsRefs})
        > {
  $KeywordsTableManager(_$WarhammerDatabase db, Keywords table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $KeywordsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $KeywordsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $KeywordsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => KeywordsCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  KeywordsCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (e.readTable(table), $KeywordsReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({warscrollKeywordsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (warscrollKeywordsRefs) db.warscrollKeywords,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (warscrollKeywordsRefs)
                    await $_getPrefetchedData<
                      Keyword,
                      Keywords,
                      WarscrollKeyword
                    >(
                      currentTable: table,
                      referencedTable: $KeywordsReferences
                          ._warscrollKeywordsRefsTable(db),
                      managerFromTypedResult: (p0) => $KeywordsReferences(
                        db,
                        table,
                        p0,
                      ).warscrollKeywordsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.keywordId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $KeywordsProcessedTableManager =
    ProcessedTableManager<
      _$WarhammerDatabase,
      Keywords,
      Keyword,
      $KeywordsFilterComposer,
      $KeywordsOrderingComposer,
      $KeywordsAnnotationComposer,
      $KeywordsCreateCompanionBuilder,
      $KeywordsUpdateCompanionBuilder,
      (Keyword, $KeywordsReferences),
      Keyword,
      PrefetchHooks Function({bool warscrollKeywordsRefs})
    >;
typedef $WarscrollsCreateCompanionBuilder =
    WarscrollsCompanion Function({
      Value<int> id,
      required int spearheadId,
      required String name,
      Value<String?> imagePath,
      required int move,
      required int health,
      required int save,
      Value<int?> ward,
      Value<int> control,
      required bool isGeneral,
    });
typedef $WarscrollsUpdateCompanionBuilder =
    WarscrollsCompanion Function({
      Value<int> id,
      Value<int> spearheadId,
      Value<String> name,
      Value<String?> imagePath,
      Value<int> move,
      Value<int> health,
      Value<int> save,
      Value<int?> ward,
      Value<int> control,
      Value<bool> isGeneral,
    });

final class $WarscrollsReferences
    extends BaseReferences<_$WarhammerDatabase, Warscrolls, Warscroll> {
  $WarscrollsReferences(super.$_db, super.$_table, super.$_typedResult);

  static Spearheads _spearheadIdTable(_$WarhammerDatabase db) =>
      db.spearheads.createAlias(
        $_aliasNameGenerator(db.warscrolls.spearheadId, db.spearheads.id),
      );

  $SpearheadsProcessedTableManager get spearheadId {
    final $_column = $_itemColumn<int>('spearhead_id')!;

    final manager = $SpearheadsTableManager(
      $_db,
      $_db.spearheads,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_spearheadIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<WarscrollKeywords, List<WarscrollKeyword>>
  _warscrollKeywordsRefsTable(_$WarhammerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.warscrollKeywords,
        aliasName: $_aliasNameGenerator(
          db.warscrolls.id,
          db.warscrollKeywords.warscrollId,
        ),
      );

  $WarscrollKeywordsProcessedTableManager get warscrollKeywordsRefs {
    final manager = $WarscrollKeywordsTableManager(
      $_db,
      $_db.warscrollKeywords,
    ).filter((f) => f.warscrollId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _warscrollKeywordsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<Weapons, List<Weapon>> _weaponsRefsTable(
    _$WarhammerDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.weapons,
    aliasName: $_aliasNameGenerator(db.warscrolls.id, db.weapons.warscrollId),
  );

  $WeaponsProcessedTableManager get weaponsRefs {
    final manager = $WeaponsTableManager(
      $_db,
      $_db.weapons,
    ).filter((f) => f.warscrollId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_weaponsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<WarscrollAbilities, List<WarscrollAbility>>
  _warscrollAbilitiesRefsTable(_$WarhammerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.warscrollAbilities,
        aliasName: $_aliasNameGenerator(
          db.warscrolls.id,
          db.warscrollAbilities.warscrollId,
        ),
      );

  $WarscrollAbilitiesProcessedTableManager get warscrollAbilitiesRefs {
    final manager = $WarscrollAbilitiesTableManager(
      $_db,
      $_db.warscrollAbilities,
    ).filter((f) => f.warscrollId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _warscrollAbilitiesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $WarscrollsFilterComposer
    extends Composer<_$WarhammerDatabase, Warscrolls> {
  $WarscrollsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get move => $composableBuilder(
    column: $table.move,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get health => $composableBuilder(
    column: $table.health,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get save => $composableBuilder(
    column: $table.save,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ward => $composableBuilder(
    column: $table.ward,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get control => $composableBuilder(
    column: $table.control,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isGeneral => $composableBuilder(
    column: $table.isGeneral,
    builder: (column) => ColumnFilters(column),
  );

  $SpearheadsFilterComposer get spearheadId {
    final $SpearheadsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spearheadId,
      referencedTable: $db.spearheads,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $SpearheadsFilterComposer(
            $db: $db,
            $table: $db.spearheads,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> warscrollKeywordsRefs(
    Expression<bool> Function($WarscrollKeywordsFilterComposer f) f,
  ) {
    final $WarscrollKeywordsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.warscrollKeywords,
      getReferencedColumn: (t) => t.warscrollId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollKeywordsFilterComposer(
            $db: $db,
            $table: $db.warscrollKeywords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> weaponsRefs(
    Expression<bool> Function($WeaponsFilterComposer f) f,
  ) {
    final $WeaponsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.weapons,
      getReferencedColumn: (t) => t.warscrollId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WeaponsFilterComposer(
            $db: $db,
            $table: $db.weapons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> warscrollAbilitiesRefs(
    Expression<bool> Function($WarscrollAbilitiesFilterComposer f) f,
  ) {
    final $WarscrollAbilitiesFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.warscrollAbilities,
      getReferencedColumn: (t) => t.warscrollId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollAbilitiesFilterComposer(
            $db: $db,
            $table: $db.warscrollAbilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $WarscrollsOrderingComposer
    extends Composer<_$WarhammerDatabase, Warscrolls> {
  $WarscrollsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get move => $composableBuilder(
    column: $table.move,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get health => $composableBuilder(
    column: $table.health,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get save => $composableBuilder(
    column: $table.save,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ward => $composableBuilder(
    column: $table.ward,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get control => $composableBuilder(
    column: $table.control,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isGeneral => $composableBuilder(
    column: $table.isGeneral,
    builder: (column) => ColumnOrderings(column),
  );

  $SpearheadsOrderingComposer get spearheadId {
    final $SpearheadsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spearheadId,
      referencedTable: $db.spearheads,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $SpearheadsOrderingComposer(
            $db: $db,
            $table: $db.spearheads,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $WarscrollsAnnotationComposer
    extends Composer<_$WarhammerDatabase, Warscrolls> {
  $WarscrollsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<int> get move =>
      $composableBuilder(column: $table.move, builder: (column) => column);

  GeneratedColumn<int> get health =>
      $composableBuilder(column: $table.health, builder: (column) => column);

  GeneratedColumn<int> get save =>
      $composableBuilder(column: $table.save, builder: (column) => column);

  GeneratedColumn<int> get ward =>
      $composableBuilder(column: $table.ward, builder: (column) => column);

  GeneratedColumn<int> get control =>
      $composableBuilder(column: $table.control, builder: (column) => column);

  GeneratedColumn<bool> get isGeneral =>
      $composableBuilder(column: $table.isGeneral, builder: (column) => column);

  $SpearheadsAnnotationComposer get spearheadId {
    final $SpearheadsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spearheadId,
      referencedTable: $db.spearheads,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $SpearheadsAnnotationComposer(
            $db: $db,
            $table: $db.spearheads,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> warscrollKeywordsRefs<T extends Object>(
    Expression<T> Function($WarscrollKeywordsAnnotationComposer a) f,
  ) {
    final $WarscrollKeywordsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.warscrollKeywords,
      getReferencedColumn: (t) => t.warscrollId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollKeywordsAnnotationComposer(
            $db: $db,
            $table: $db.warscrollKeywords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> weaponsRefs<T extends Object>(
    Expression<T> Function($WeaponsAnnotationComposer a) f,
  ) {
    final $WeaponsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.weapons,
      getReferencedColumn: (t) => t.warscrollId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WeaponsAnnotationComposer(
            $db: $db,
            $table: $db.weapons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> warscrollAbilitiesRefs<T extends Object>(
    Expression<T> Function($WarscrollAbilitiesAnnotationComposer a) f,
  ) {
    final $WarscrollAbilitiesAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.warscrollAbilities,
      getReferencedColumn: (t) => t.warscrollId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollAbilitiesAnnotationComposer(
            $db: $db,
            $table: $db.warscrollAbilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $WarscrollsTableManager
    extends
        RootTableManager<
          _$WarhammerDatabase,
          Warscrolls,
          Warscroll,
          $WarscrollsFilterComposer,
          $WarscrollsOrderingComposer,
          $WarscrollsAnnotationComposer,
          $WarscrollsCreateCompanionBuilder,
          $WarscrollsUpdateCompanionBuilder,
          (Warscroll, $WarscrollsReferences),
          Warscroll,
          PrefetchHooks Function({
            bool spearheadId,
            bool warscrollKeywordsRefs,
            bool weaponsRefs,
            bool warscrollAbilitiesRefs,
          })
        > {
  $WarscrollsTableManager(_$WarhammerDatabase db, Warscrolls table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $WarscrollsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $WarscrollsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $WarscrollsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> spearheadId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<int> move = const Value.absent(),
                Value<int> health = const Value.absent(),
                Value<int> save = const Value.absent(),
                Value<int?> ward = const Value.absent(),
                Value<int> control = const Value.absent(),
                Value<bool> isGeneral = const Value.absent(),
              }) => WarscrollsCompanion(
                id: id,
                spearheadId: spearheadId,
                name: name,
                imagePath: imagePath,
                move: move,
                health: health,
                save: save,
                ward: ward,
                control: control,
                isGeneral: isGeneral,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int spearheadId,
                required String name,
                Value<String?> imagePath = const Value.absent(),
                required int move,
                required int health,
                required int save,
                Value<int?> ward = const Value.absent(),
                Value<int> control = const Value.absent(),
                required bool isGeneral,
              }) => WarscrollsCompanion.insert(
                id: id,
                spearheadId: spearheadId,
                name: name,
                imagePath: imagePath,
                move: move,
                health: health,
                save: save,
                ward: ward,
                control: control,
                isGeneral: isGeneral,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $WarscrollsReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                spearheadId = false,
                warscrollKeywordsRefs = false,
                weaponsRefs = false,
                warscrollAbilitiesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (warscrollKeywordsRefs) db.warscrollKeywords,
                    if (weaponsRefs) db.weapons,
                    if (warscrollAbilitiesRefs) db.warscrollAbilities,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (spearheadId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.spearheadId,
                                    referencedTable: $WarscrollsReferences
                                        ._spearheadIdTable(db),
                                    referencedColumn: $WarscrollsReferences
                                        ._spearheadIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (warscrollKeywordsRefs)
                        await $_getPrefetchedData<
                          Warscroll,
                          Warscrolls,
                          WarscrollKeyword
                        >(
                          currentTable: table,
                          referencedTable: $WarscrollsReferences
                              ._warscrollKeywordsRefsTable(db),
                          managerFromTypedResult: (p0) => $WarscrollsReferences(
                            db,
                            table,
                            p0,
                          ).warscrollKeywordsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.warscrollId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (weaponsRefs)
                        await $_getPrefetchedData<
                          Warscroll,
                          Warscrolls,
                          Weapon
                        >(
                          currentTable: table,
                          referencedTable: $WarscrollsReferences
                              ._weaponsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $WarscrollsReferences(db, table, p0).weaponsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.warscrollId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (warscrollAbilitiesRefs)
                        await $_getPrefetchedData<
                          Warscroll,
                          Warscrolls,
                          WarscrollAbility
                        >(
                          currentTable: table,
                          referencedTable: $WarscrollsReferences
                              ._warscrollAbilitiesRefsTable(db),
                          managerFromTypedResult: (p0) => $WarscrollsReferences(
                            db,
                            table,
                            p0,
                          ).warscrollAbilitiesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.warscrollId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $WarscrollsProcessedTableManager =
    ProcessedTableManager<
      _$WarhammerDatabase,
      Warscrolls,
      Warscroll,
      $WarscrollsFilterComposer,
      $WarscrollsOrderingComposer,
      $WarscrollsAnnotationComposer,
      $WarscrollsCreateCompanionBuilder,
      $WarscrollsUpdateCompanionBuilder,
      (Warscroll, $WarscrollsReferences),
      Warscroll,
      PrefetchHooks Function({
        bool spearheadId,
        bool warscrollKeywordsRefs,
        bool weaponsRefs,
        bool warscrollAbilitiesRefs,
      })
    >;
typedef $WarscrollKeywordsCreateCompanionBuilder =
    WarscrollKeywordsCompanion Function({
      required int warscrollId,
      required int keywordId,
    });
typedef $WarscrollKeywordsUpdateCompanionBuilder =
    WarscrollKeywordsCompanion Function({
      Value<int> warscrollId,
      Value<int> keywordId,
    });

final class $WarscrollKeywordsReferences
    extends
        BaseReferences<
          _$WarhammerDatabase,
          WarscrollKeywords,
          WarscrollKeyword
        > {
  $WarscrollKeywordsReferences(super.$_db, super.$_table, super.$_typedResult);

  static Warscrolls _warscrollIdTable(_$WarhammerDatabase db) =>
      db.warscrolls.createAlias(
        $_aliasNameGenerator(
          db.warscrollKeywords.warscrollId,
          db.warscrolls.id,
        ),
      );

  $WarscrollsProcessedTableManager get warscrollId {
    final $_column = $_itemColumn<int>('warscroll_id')!;

    final manager = $WarscrollsTableManager(
      $_db,
      $_db.warscrolls,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_warscrollIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static Keywords _keywordIdTable(_$WarhammerDatabase db) =>
      db.keywords.createAlias(
        $_aliasNameGenerator(db.warscrollKeywords.keywordId, db.keywords.id),
      );

  $KeywordsProcessedTableManager get keywordId {
    final $_column = $_itemColumn<int>('keyword_id')!;

    final manager = $KeywordsTableManager(
      $_db,
      $_db.keywords,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_keywordIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $WarscrollKeywordsFilterComposer
    extends Composer<_$WarhammerDatabase, WarscrollKeywords> {
  $WarscrollKeywordsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $WarscrollsFilterComposer get warscrollId {
    final $WarscrollsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.warscrollId,
      referencedTable: $db.warscrolls,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollsFilterComposer(
            $db: $db,
            $table: $db.warscrolls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $KeywordsFilterComposer get keywordId {
    final $KeywordsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.keywordId,
      referencedTable: $db.keywords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $KeywordsFilterComposer(
            $db: $db,
            $table: $db.keywords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $WarscrollKeywordsOrderingComposer
    extends Composer<_$WarhammerDatabase, WarscrollKeywords> {
  $WarscrollKeywordsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $WarscrollsOrderingComposer get warscrollId {
    final $WarscrollsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.warscrollId,
      referencedTable: $db.warscrolls,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollsOrderingComposer(
            $db: $db,
            $table: $db.warscrolls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $KeywordsOrderingComposer get keywordId {
    final $KeywordsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.keywordId,
      referencedTable: $db.keywords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $KeywordsOrderingComposer(
            $db: $db,
            $table: $db.keywords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $WarscrollKeywordsAnnotationComposer
    extends Composer<_$WarhammerDatabase, WarscrollKeywords> {
  $WarscrollKeywordsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $WarscrollsAnnotationComposer get warscrollId {
    final $WarscrollsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.warscrollId,
      referencedTable: $db.warscrolls,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollsAnnotationComposer(
            $db: $db,
            $table: $db.warscrolls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $KeywordsAnnotationComposer get keywordId {
    final $KeywordsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.keywordId,
      referencedTable: $db.keywords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $KeywordsAnnotationComposer(
            $db: $db,
            $table: $db.keywords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $WarscrollKeywordsTableManager
    extends
        RootTableManager<
          _$WarhammerDatabase,
          WarscrollKeywords,
          WarscrollKeyword,
          $WarscrollKeywordsFilterComposer,
          $WarscrollKeywordsOrderingComposer,
          $WarscrollKeywordsAnnotationComposer,
          $WarscrollKeywordsCreateCompanionBuilder,
          $WarscrollKeywordsUpdateCompanionBuilder,
          (WarscrollKeyword, $WarscrollKeywordsReferences),
          WarscrollKeyword,
          PrefetchHooks Function({bool warscrollId, bool keywordId})
        > {
  $WarscrollKeywordsTableManager(
    _$WarhammerDatabase db,
    WarscrollKeywords table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $WarscrollKeywordsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $WarscrollKeywordsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $WarscrollKeywordsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> warscrollId = const Value.absent(),
                Value<int> keywordId = const Value.absent(),
              }) => WarscrollKeywordsCompanion(
                warscrollId: warscrollId,
                keywordId: keywordId,
              ),
          createCompanionCallback:
              ({required int warscrollId, required int keywordId}) =>
                  WarscrollKeywordsCompanion.insert(
                    warscrollId: warscrollId,
                    keywordId: keywordId,
                  ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $WarscrollKeywordsReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({warscrollId = false, keywordId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (warscrollId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.warscrollId,
                                referencedTable: $WarscrollKeywordsReferences
                                    ._warscrollIdTable(db),
                                referencedColumn: $WarscrollKeywordsReferences
                                    ._warscrollIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (keywordId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.keywordId,
                                referencedTable: $WarscrollKeywordsReferences
                                    ._keywordIdTable(db),
                                referencedColumn: $WarscrollKeywordsReferences
                                    ._keywordIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $WarscrollKeywordsProcessedTableManager =
    ProcessedTableManager<
      _$WarhammerDatabase,
      WarscrollKeywords,
      WarscrollKeyword,
      $WarscrollKeywordsFilterComposer,
      $WarscrollKeywordsOrderingComposer,
      $WarscrollKeywordsAnnotationComposer,
      $WarscrollKeywordsCreateCompanionBuilder,
      $WarscrollKeywordsUpdateCompanionBuilder,
      (WarscrollKeyword, $WarscrollKeywordsReferences),
      WarscrollKeyword,
      PrefetchHooks Function({bool warscrollId, bool keywordId})
    >;
typedef $WeaponsCreateCompanionBuilder =
    WeaponsCompanion Function({
      required int warscrollId,
      required String name,
      required String attacks,
      required int hit,
      required int wound,
      Value<int> rend,
      required String damage,
      Value<String?> specialRule,
    });
typedef $WeaponsUpdateCompanionBuilder =
    WeaponsCompanion Function({
      Value<int> warscrollId,
      Value<String> name,
      Value<String> attacks,
      Value<int> hit,
      Value<int> wound,
      Value<int> rend,
      Value<String> damage,
      Value<String?> specialRule,
    });

final class $WeaponsReferences
    extends BaseReferences<_$WarhammerDatabase, Weapons, Weapon> {
  $WeaponsReferences(super.$_db, super.$_table, super.$_typedResult);

  static Warscrolls _warscrollIdTable(_$WarhammerDatabase db) =>
      db.warscrolls.createAlias(
        $_aliasNameGenerator(db.weapons.warscrollId, db.warscrolls.id),
      );

  $WarscrollsProcessedTableManager get warscrollId {
    final $_column = $_itemColumn<int>('warscroll_id')!;

    final manager = $WarscrollsTableManager(
      $_db,
      $_db.warscrolls,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_warscrollIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $WeaponsFilterComposer extends Composer<_$WarhammerDatabase, Weapons> {
  $WeaponsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attacks => $composableBuilder(
    column: $table.attacks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hit => $composableBuilder(
    column: $table.hit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wound => $composableBuilder(
    column: $table.wound,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rend => $composableBuilder(
    column: $table.rend,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get damage => $composableBuilder(
    column: $table.damage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specialRule => $composableBuilder(
    column: $table.specialRule,
    builder: (column) => ColumnFilters(column),
  );

  $WarscrollsFilterComposer get warscrollId {
    final $WarscrollsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.warscrollId,
      referencedTable: $db.warscrolls,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollsFilterComposer(
            $db: $db,
            $table: $db.warscrolls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $WeaponsOrderingComposer extends Composer<_$WarhammerDatabase, Weapons> {
  $WeaponsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attacks => $composableBuilder(
    column: $table.attacks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hit => $composableBuilder(
    column: $table.hit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wound => $composableBuilder(
    column: $table.wound,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rend => $composableBuilder(
    column: $table.rend,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get damage => $composableBuilder(
    column: $table.damage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specialRule => $composableBuilder(
    column: $table.specialRule,
    builder: (column) => ColumnOrderings(column),
  );

  $WarscrollsOrderingComposer get warscrollId {
    final $WarscrollsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.warscrollId,
      referencedTable: $db.warscrolls,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollsOrderingComposer(
            $db: $db,
            $table: $db.warscrolls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $WeaponsAnnotationComposer
    extends Composer<_$WarhammerDatabase, Weapons> {
  $WeaponsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get attacks =>
      $composableBuilder(column: $table.attacks, builder: (column) => column);

  GeneratedColumn<int> get hit =>
      $composableBuilder(column: $table.hit, builder: (column) => column);

  GeneratedColumn<int> get wound =>
      $composableBuilder(column: $table.wound, builder: (column) => column);

  GeneratedColumn<int> get rend =>
      $composableBuilder(column: $table.rend, builder: (column) => column);

  GeneratedColumn<String> get damage =>
      $composableBuilder(column: $table.damage, builder: (column) => column);

  GeneratedColumn<String> get specialRule => $composableBuilder(
    column: $table.specialRule,
    builder: (column) => column,
  );

  $WarscrollsAnnotationComposer get warscrollId {
    final $WarscrollsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.warscrollId,
      referencedTable: $db.warscrolls,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollsAnnotationComposer(
            $db: $db,
            $table: $db.warscrolls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $WeaponsTableManager
    extends
        RootTableManager<
          _$WarhammerDatabase,
          Weapons,
          Weapon,
          $WeaponsFilterComposer,
          $WeaponsOrderingComposer,
          $WeaponsAnnotationComposer,
          $WeaponsCreateCompanionBuilder,
          $WeaponsUpdateCompanionBuilder,
          (Weapon, $WeaponsReferences),
          Weapon,
          PrefetchHooks Function({bool warscrollId})
        > {
  $WeaponsTableManager(_$WarhammerDatabase db, Weapons table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $WeaponsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $WeaponsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $WeaponsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> warscrollId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> attacks = const Value.absent(),
                Value<int> hit = const Value.absent(),
                Value<int> wound = const Value.absent(),
                Value<int> rend = const Value.absent(),
                Value<String> damage = const Value.absent(),
                Value<String?> specialRule = const Value.absent(),
              }) => WeaponsCompanion(
                warscrollId: warscrollId,
                name: name,
                attacks: attacks,
                hit: hit,
                wound: wound,
                rend: rend,
                damage: damage,
                specialRule: specialRule,
              ),
          createCompanionCallback:
              ({
                required int warscrollId,
                required String name,
                required String attacks,
                required int hit,
                required int wound,
                Value<int> rend = const Value.absent(),
                required String damage,
                Value<String?> specialRule = const Value.absent(),
              }) => WeaponsCompanion.insert(
                warscrollId: warscrollId,
                name: name,
                attacks: attacks,
                hit: hit,
                wound: wound,
                rend: rend,
                damage: damage,
                specialRule: specialRule,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (e.readTable(table), $WeaponsReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({warscrollId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (warscrollId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.warscrollId,
                                referencedTable: $WeaponsReferences
                                    ._warscrollIdTable(db),
                                referencedColumn: $WeaponsReferences
                                    ._warscrollIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $WeaponsProcessedTableManager =
    ProcessedTableManager<
      _$WarhammerDatabase,
      Weapons,
      Weapon,
      $WeaponsFilterComposer,
      $WeaponsOrderingComposer,
      $WeaponsAnnotationComposer,
      $WeaponsCreateCompanionBuilder,
      $WeaponsUpdateCompanionBuilder,
      (Weapon, $WeaponsReferences),
      Weapon,
      PrefetchHooks Function({bool warscrollId})
    >;
typedef $AbilitiesCreateCompanionBuilder =
    AbilitiesCompanion Function({
      Value<int> id,
      required String name,
      required String type,
      Value<String?> timing,
      required String description,
    });
typedef $AbilitiesUpdateCompanionBuilder =
    AbilitiesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> type,
      Value<String?> timing,
      Value<String> description,
    });

final class $AbilitiesReferences
    extends BaseReferences<_$WarhammerDatabase, Abilities, Ability> {
  $AbilitiesReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<WarscrollAbilities, List<WarscrollAbility>>
  _warscrollAbilitiesRefsTable(_$WarhammerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.warscrollAbilities,
        aliasName: $_aliasNameGenerator(
          db.abilities.id,
          db.warscrollAbilities.abilityId,
        ),
      );

  $WarscrollAbilitiesProcessedTableManager get warscrollAbilitiesRefs {
    final manager = $WarscrollAbilitiesTableManager(
      $_db,
      $_db.warscrollAbilities,
    ).filter((f) => f.abilityId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _warscrollAbilitiesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<SpearheadAbilities, List<SpearheadAbility>>
  _spearheadAbilitiesRefsTable(_$WarhammerDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.spearheadAbilities,
        aliasName: $_aliasNameGenerator(
          db.abilities.id,
          db.spearheadAbilities.abilityId,
        ),
      );

  $SpearheadAbilitiesProcessedTableManager get spearheadAbilitiesRefs {
    final manager = $SpearheadAbilitiesTableManager(
      $_db,
      $_db.spearheadAbilities,
    ).filter((f) => f.abilityId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _spearheadAbilitiesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $AbilitiesFilterComposer
    extends Composer<_$WarhammerDatabase, Abilities> {
  $AbilitiesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timing => $composableBuilder(
    column: $table.timing,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> warscrollAbilitiesRefs(
    Expression<bool> Function($WarscrollAbilitiesFilterComposer f) f,
  ) {
    final $WarscrollAbilitiesFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.warscrollAbilities,
      getReferencedColumn: (t) => t.abilityId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollAbilitiesFilterComposer(
            $db: $db,
            $table: $db.warscrollAbilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> spearheadAbilitiesRefs(
    Expression<bool> Function($SpearheadAbilitiesFilterComposer f) f,
  ) {
    final $SpearheadAbilitiesFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.spearheadAbilities,
      getReferencedColumn: (t) => t.abilityId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $SpearheadAbilitiesFilterComposer(
            $db: $db,
            $table: $db.spearheadAbilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $AbilitiesOrderingComposer
    extends Composer<_$WarhammerDatabase, Abilities> {
  $AbilitiesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timing => $composableBuilder(
    column: $table.timing,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $AbilitiesAnnotationComposer
    extends Composer<_$WarhammerDatabase, Abilities> {
  $AbilitiesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get timing =>
      $composableBuilder(column: $table.timing, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  Expression<T> warscrollAbilitiesRefs<T extends Object>(
    Expression<T> Function($WarscrollAbilitiesAnnotationComposer a) f,
  ) {
    final $WarscrollAbilitiesAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.warscrollAbilities,
      getReferencedColumn: (t) => t.abilityId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollAbilitiesAnnotationComposer(
            $db: $db,
            $table: $db.warscrollAbilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> spearheadAbilitiesRefs<T extends Object>(
    Expression<T> Function($SpearheadAbilitiesAnnotationComposer a) f,
  ) {
    final $SpearheadAbilitiesAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.spearheadAbilities,
      getReferencedColumn: (t) => t.abilityId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $SpearheadAbilitiesAnnotationComposer(
            $db: $db,
            $table: $db.spearheadAbilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $AbilitiesTableManager
    extends
        RootTableManager<
          _$WarhammerDatabase,
          Abilities,
          Ability,
          $AbilitiesFilterComposer,
          $AbilitiesOrderingComposer,
          $AbilitiesAnnotationComposer,
          $AbilitiesCreateCompanionBuilder,
          $AbilitiesUpdateCompanionBuilder,
          (Ability, $AbilitiesReferences),
          Ability,
          PrefetchHooks Function({
            bool warscrollAbilitiesRefs,
            bool spearheadAbilitiesRefs,
          })
        > {
  $AbilitiesTableManager(_$WarhammerDatabase db, Abilities table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $AbilitiesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $AbilitiesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $AbilitiesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> timing = const Value.absent(),
                Value<String> description = const Value.absent(),
              }) => AbilitiesCompanion(
                id: id,
                name: name,
                type: type,
                timing: timing,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String type,
                Value<String?> timing = const Value.absent(),
                required String description,
              }) => AbilitiesCompanion.insert(
                id: id,
                name: name,
                type: type,
                timing: timing,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (e.readTable(table), $AbilitiesReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                warscrollAbilitiesRefs = false,
                spearheadAbilitiesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (warscrollAbilitiesRefs) db.warscrollAbilities,
                    if (spearheadAbilitiesRefs) db.spearheadAbilities,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (warscrollAbilitiesRefs)
                        await $_getPrefetchedData<
                          Ability,
                          Abilities,
                          WarscrollAbility
                        >(
                          currentTable: table,
                          referencedTable: $AbilitiesReferences
                              ._warscrollAbilitiesRefsTable(db),
                          managerFromTypedResult: (p0) => $AbilitiesReferences(
                            db,
                            table,
                            p0,
                          ).warscrollAbilitiesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.abilityId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (spearheadAbilitiesRefs)
                        await $_getPrefetchedData<
                          Ability,
                          Abilities,
                          SpearheadAbility
                        >(
                          currentTable: table,
                          referencedTable: $AbilitiesReferences
                              ._spearheadAbilitiesRefsTable(db),
                          managerFromTypedResult: (p0) => $AbilitiesReferences(
                            db,
                            table,
                            p0,
                          ).spearheadAbilitiesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.abilityId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $AbilitiesProcessedTableManager =
    ProcessedTableManager<
      _$WarhammerDatabase,
      Abilities,
      Ability,
      $AbilitiesFilterComposer,
      $AbilitiesOrderingComposer,
      $AbilitiesAnnotationComposer,
      $AbilitiesCreateCompanionBuilder,
      $AbilitiesUpdateCompanionBuilder,
      (Ability, $AbilitiesReferences),
      Ability,
      PrefetchHooks Function({
        bool warscrollAbilitiesRefs,
        bool spearheadAbilitiesRefs,
      })
    >;
typedef $WarscrollAbilitiesCreateCompanionBuilder =
    WarscrollAbilitiesCompanion Function({
      required int warscrollId,
      required int abilityId,
    });
typedef $WarscrollAbilitiesUpdateCompanionBuilder =
    WarscrollAbilitiesCompanion Function({
      Value<int> warscrollId,
      Value<int> abilityId,
    });

final class $WarscrollAbilitiesReferences
    extends
        BaseReferences<
          _$WarhammerDatabase,
          WarscrollAbilities,
          WarscrollAbility
        > {
  $WarscrollAbilitiesReferences(super.$_db, super.$_table, super.$_typedResult);

  static Warscrolls _warscrollIdTable(_$WarhammerDatabase db) =>
      db.warscrolls.createAlias(
        $_aliasNameGenerator(
          db.warscrollAbilities.warscrollId,
          db.warscrolls.id,
        ),
      );

  $WarscrollsProcessedTableManager get warscrollId {
    final $_column = $_itemColumn<int>('warscroll_id')!;

    final manager = $WarscrollsTableManager(
      $_db,
      $_db.warscrolls,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_warscrollIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static Abilities _abilityIdTable(_$WarhammerDatabase db) =>
      db.abilities.createAlias(
        $_aliasNameGenerator(db.warscrollAbilities.abilityId, db.abilities.id),
      );

  $AbilitiesProcessedTableManager get abilityId {
    final $_column = $_itemColumn<int>('ability_id')!;

    final manager = $AbilitiesTableManager(
      $_db,
      $_db.abilities,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_abilityIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $WarscrollAbilitiesFilterComposer
    extends Composer<_$WarhammerDatabase, WarscrollAbilities> {
  $WarscrollAbilitiesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $WarscrollsFilterComposer get warscrollId {
    final $WarscrollsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.warscrollId,
      referencedTable: $db.warscrolls,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollsFilterComposer(
            $db: $db,
            $table: $db.warscrolls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $AbilitiesFilterComposer get abilityId {
    final $AbilitiesFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.abilityId,
      referencedTable: $db.abilities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $AbilitiesFilterComposer(
            $db: $db,
            $table: $db.abilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $WarscrollAbilitiesOrderingComposer
    extends Composer<_$WarhammerDatabase, WarscrollAbilities> {
  $WarscrollAbilitiesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $WarscrollsOrderingComposer get warscrollId {
    final $WarscrollsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.warscrollId,
      referencedTable: $db.warscrolls,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollsOrderingComposer(
            $db: $db,
            $table: $db.warscrolls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $AbilitiesOrderingComposer get abilityId {
    final $AbilitiesOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.abilityId,
      referencedTable: $db.abilities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $AbilitiesOrderingComposer(
            $db: $db,
            $table: $db.abilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $WarscrollAbilitiesAnnotationComposer
    extends Composer<_$WarhammerDatabase, WarscrollAbilities> {
  $WarscrollAbilitiesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $WarscrollsAnnotationComposer get warscrollId {
    final $WarscrollsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.warscrollId,
      referencedTable: $db.warscrolls,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $WarscrollsAnnotationComposer(
            $db: $db,
            $table: $db.warscrolls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $AbilitiesAnnotationComposer get abilityId {
    final $AbilitiesAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.abilityId,
      referencedTable: $db.abilities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $AbilitiesAnnotationComposer(
            $db: $db,
            $table: $db.abilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $WarscrollAbilitiesTableManager
    extends
        RootTableManager<
          _$WarhammerDatabase,
          WarscrollAbilities,
          WarscrollAbility,
          $WarscrollAbilitiesFilterComposer,
          $WarscrollAbilitiesOrderingComposer,
          $WarscrollAbilitiesAnnotationComposer,
          $WarscrollAbilitiesCreateCompanionBuilder,
          $WarscrollAbilitiesUpdateCompanionBuilder,
          (WarscrollAbility, $WarscrollAbilitiesReferences),
          WarscrollAbility,
          PrefetchHooks Function({bool warscrollId, bool abilityId})
        > {
  $WarscrollAbilitiesTableManager(
    _$WarhammerDatabase db,
    WarscrollAbilities table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $WarscrollAbilitiesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $WarscrollAbilitiesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $WarscrollAbilitiesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> warscrollId = const Value.absent(),
                Value<int> abilityId = const Value.absent(),
              }) => WarscrollAbilitiesCompanion(
                warscrollId: warscrollId,
                abilityId: abilityId,
              ),
          createCompanionCallback:
              ({required int warscrollId, required int abilityId}) =>
                  WarscrollAbilitiesCompanion.insert(
                    warscrollId: warscrollId,
                    abilityId: abilityId,
                  ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $WarscrollAbilitiesReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({warscrollId = false, abilityId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (warscrollId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.warscrollId,
                                referencedTable: $WarscrollAbilitiesReferences
                                    ._warscrollIdTable(db),
                                referencedColumn: $WarscrollAbilitiesReferences
                                    ._warscrollIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (abilityId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.abilityId,
                                referencedTable: $WarscrollAbilitiesReferences
                                    ._abilityIdTable(db),
                                referencedColumn: $WarscrollAbilitiesReferences
                                    ._abilityIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $WarscrollAbilitiesProcessedTableManager =
    ProcessedTableManager<
      _$WarhammerDatabase,
      WarscrollAbilities,
      WarscrollAbility,
      $WarscrollAbilitiesFilterComposer,
      $WarscrollAbilitiesOrderingComposer,
      $WarscrollAbilitiesAnnotationComposer,
      $WarscrollAbilitiesCreateCompanionBuilder,
      $WarscrollAbilitiesUpdateCompanionBuilder,
      (WarscrollAbility, $WarscrollAbilitiesReferences),
      WarscrollAbility,
      PrefetchHooks Function({bool warscrollId, bool abilityId})
    >;
typedef $SpearheadAbilitiesCreateCompanionBuilder =
    SpearheadAbilitiesCompanion Function({
      required int spearheadId,
      required int abilityId,
      required String type,
    });
typedef $SpearheadAbilitiesUpdateCompanionBuilder =
    SpearheadAbilitiesCompanion Function({
      Value<int> spearheadId,
      Value<int> abilityId,
      Value<String> type,
    });

final class $SpearheadAbilitiesReferences
    extends
        BaseReferences<
          _$WarhammerDatabase,
          SpearheadAbilities,
          SpearheadAbility
        > {
  $SpearheadAbilitiesReferences(super.$_db, super.$_table, super.$_typedResult);

  static Spearheads _spearheadIdTable(_$WarhammerDatabase db) =>
      db.spearheads.createAlias(
        $_aliasNameGenerator(
          db.spearheadAbilities.spearheadId,
          db.spearheads.id,
        ),
      );

  $SpearheadsProcessedTableManager get spearheadId {
    final $_column = $_itemColumn<int>('spearhead_id')!;

    final manager = $SpearheadsTableManager(
      $_db,
      $_db.spearheads,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_spearheadIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static Abilities _abilityIdTable(_$WarhammerDatabase db) =>
      db.abilities.createAlias(
        $_aliasNameGenerator(db.spearheadAbilities.abilityId, db.abilities.id),
      );

  $AbilitiesProcessedTableManager get abilityId {
    final $_column = $_itemColumn<int>('ability_id')!;

    final manager = $AbilitiesTableManager(
      $_db,
      $_db.abilities,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_abilityIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $SpearheadAbilitiesFilterComposer
    extends Composer<_$WarhammerDatabase, SpearheadAbilities> {
  $SpearheadAbilitiesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  $SpearheadsFilterComposer get spearheadId {
    final $SpearheadsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spearheadId,
      referencedTable: $db.spearheads,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $SpearheadsFilterComposer(
            $db: $db,
            $table: $db.spearheads,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $AbilitiesFilterComposer get abilityId {
    final $AbilitiesFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.abilityId,
      referencedTable: $db.abilities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $AbilitiesFilterComposer(
            $db: $db,
            $table: $db.abilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $SpearheadAbilitiesOrderingComposer
    extends Composer<_$WarhammerDatabase, SpearheadAbilities> {
  $SpearheadAbilitiesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  $SpearheadsOrderingComposer get spearheadId {
    final $SpearheadsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spearheadId,
      referencedTable: $db.spearheads,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $SpearheadsOrderingComposer(
            $db: $db,
            $table: $db.spearheads,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $AbilitiesOrderingComposer get abilityId {
    final $AbilitiesOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.abilityId,
      referencedTable: $db.abilities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $AbilitiesOrderingComposer(
            $db: $db,
            $table: $db.abilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $SpearheadAbilitiesAnnotationComposer
    extends Composer<_$WarhammerDatabase, SpearheadAbilities> {
  $SpearheadAbilitiesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  $SpearheadsAnnotationComposer get spearheadId {
    final $SpearheadsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spearheadId,
      referencedTable: $db.spearheads,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $SpearheadsAnnotationComposer(
            $db: $db,
            $table: $db.spearheads,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $AbilitiesAnnotationComposer get abilityId {
    final $AbilitiesAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.abilityId,
      referencedTable: $db.abilities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $AbilitiesAnnotationComposer(
            $db: $db,
            $table: $db.abilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $SpearheadAbilitiesTableManager
    extends
        RootTableManager<
          _$WarhammerDatabase,
          SpearheadAbilities,
          SpearheadAbility,
          $SpearheadAbilitiesFilterComposer,
          $SpearheadAbilitiesOrderingComposer,
          $SpearheadAbilitiesAnnotationComposer,
          $SpearheadAbilitiesCreateCompanionBuilder,
          $SpearheadAbilitiesUpdateCompanionBuilder,
          (SpearheadAbility, $SpearheadAbilitiesReferences),
          SpearheadAbility,
          PrefetchHooks Function({bool spearheadId, bool abilityId})
        > {
  $SpearheadAbilitiesTableManager(
    _$WarhammerDatabase db,
    SpearheadAbilities table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $SpearheadAbilitiesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $SpearheadAbilitiesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $SpearheadAbilitiesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> spearheadId = const Value.absent(),
                Value<int> abilityId = const Value.absent(),
                Value<String> type = const Value.absent(),
              }) => SpearheadAbilitiesCompanion(
                spearheadId: spearheadId,
                abilityId: abilityId,
                type: type,
              ),
          createCompanionCallback:
              ({
                required int spearheadId,
                required int abilityId,
                required String type,
              }) => SpearheadAbilitiesCompanion.insert(
                spearheadId: spearheadId,
                abilityId: abilityId,
                type: type,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $SpearheadAbilitiesReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({spearheadId = false, abilityId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (spearheadId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.spearheadId,
                                referencedTable: $SpearheadAbilitiesReferences
                                    ._spearheadIdTable(db),
                                referencedColumn: $SpearheadAbilitiesReferences
                                    ._spearheadIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (abilityId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.abilityId,
                                referencedTable: $SpearheadAbilitiesReferences
                                    ._abilityIdTable(db),
                                referencedColumn: $SpearheadAbilitiesReferences
                                    ._abilityIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $SpearheadAbilitiesProcessedTableManager =
    ProcessedTableManager<
      _$WarhammerDatabase,
      SpearheadAbilities,
      SpearheadAbility,
      $SpearheadAbilitiesFilterComposer,
      $SpearheadAbilitiesOrderingComposer,
      $SpearheadAbilitiesAnnotationComposer,
      $SpearheadAbilitiesCreateCompanionBuilder,
      $SpearheadAbilitiesUpdateCompanionBuilder,
      (SpearheadAbility, $SpearheadAbilitiesReferences),
      SpearheadAbility,
      PrefetchHooks Function({bool spearheadId, bool abilityId})
    >;

class $WarhammerDatabaseManager {
  final _$WarhammerDatabase _db;
  $WarhammerDatabaseManager(this._db);
  $ArmiesTableManager get armies => $ArmiesTableManager(_db, _db.armies);
  $SpearheadsTableManager get spearheads =>
      $SpearheadsTableManager(_db, _db.spearheads);
  $KeywordsTableManager get keywords =>
      $KeywordsTableManager(_db, _db.keywords);
  $WarscrollsTableManager get warscrolls =>
      $WarscrollsTableManager(_db, _db.warscrolls);
  $WarscrollKeywordsTableManager get warscrollKeywords =>
      $WarscrollKeywordsTableManager(_db, _db.warscrollKeywords);
  $WeaponsTableManager get weapons => $WeaponsTableManager(_db, _db.weapons);
  $AbilitiesTableManager get abilities =>
      $AbilitiesTableManager(_db, _db.abilities);
  $WarscrollAbilitiesTableManager get warscrollAbilities =>
      $WarscrollAbilitiesTableManager(_db, _db.warscrollAbilities);
  $SpearheadAbilitiesTableManager get spearheadAbilities =>
      $SpearheadAbilitiesTableManager(_db, _db.spearheadAbilities);
}

class SearchSpearheadsResult {
  final Spearhead s;
  final String armyName;
  SearchSpearheadsResult({required this.s, required this.armyName});
}
